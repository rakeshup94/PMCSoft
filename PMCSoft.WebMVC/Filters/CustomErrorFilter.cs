
using PMCSoft.Core.Interfaces.Service;
using PMCSoft.Core.Models;
using PMCSoft.Web.Models;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.Mvc;

namespace PMCSoft.Web.Filters
{
    public class CustomErrorFilter : HandleErrorAttribute
    {
        public IErrorService _dataService { get; private set; }

        public CustomErrorFilter()
        {
            _dataService = DependencyResolver.Current.GetService<IErrorService>();
        }
        public override void OnException(ExceptionContext filterContext)
        {

            if (filterContext.ExceptionHandled || !filterContext.HttpContext.IsCustomErrorEnabled)
            {
                return;
            }
            if (new HttpException(null, filterContext.Exception).GetHttpCode() != 500)
            {
                return;
            }
            if (!ExceptionType.IsInstanceOfType(filterContext.Exception))
            {
                return;
            }
            // if the request is AJAX return JSON else view.
            if (filterContext.HttpContext.Request.Headers["X-Requested-With"] == "XMLHttpRequest")
            {
                filterContext.Result = new JsonResult
                {
                    JsonRequestBehavior = JsonRequestBehavior.AllowGet,
                    Data = new
                    {
                        error = true,
                        message = filterContext.Exception.Message
                    }
                };
            }
            else
            {
                var controllerName = (string)filterContext.RouteData.Values["controller"];
                var actionName = (string)filterContext.RouteData.Values["action"];
                var model = new HandleErrorInfo(filterContext.Exception, controllerName, actionName);
                filterContext.Result = new ViewResult
                {
                    ViewName = View,
                    MasterName = Master,
                    ViewData = new ViewDataDictionary<HandleErrorInfo>(model),
                    TempData = filterContext.Controller.TempData
                };
            }
            // log the error            
            this.LoggerError(filterContext.Exception, filterContext.HttpContext);


            filterContext.ExceptionHandled = true;
            filterContext.HttpContext.Response.Clear();
            filterContext.HttpContext.Response.StatusCode = 500;
            filterContext.HttpContext.Response.TrySkipIisCustomErrors = true;
        }
        private void LoggerError(Exception exception, HttpContextBase context)
        {
            string ipAddress = HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
            if (ipAddress == null || ipAddress == "")
            {
                ipAddress = HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"];
            }
            ErrorLogModel model = new ErrorLogModel();
            model.MachinName = System.Net.Dns.GetHostEntry(context.Request.UserHostAddress).HostName;
            model.MachinUser = Environment.UserName.ToString();
            model.URL = context.Request.Url.ToString();
            model.IPAddress = ipAddress;
            model.UserAgentInfo = context.Request.UserAgent;
            var item = context.User as CustomPrincipal;
            model.LoginId = context.User.Identity.Name;
            model.UserTimeZone = item.TimeZone;
            model.UserCulture = item.CultureId.ToString();
            model.Message = exception.Message;
            model.Source = exception.Source;
            model.StackTrace = exception.StackTrace;
            model.CreatedBy = item.UserId;
            model.CreatedOn = DateTime.Now;
            long errorId = _dataService.AddErrorLog(model);
            if (errorId == 0)
            {
                ExceptionHelper.ExceptionLogging(exception.Source, exception.Message + "\n\r" + "User :" + context.User.Identity.Name + "\n\r" + exception.StackTrace, false);
                
            }

        }



    }

    public class ExceptionHelper
    {
        static StreamWriter objBugStream;
        static string m_strPath = AppDomain.CurrentDomain.BaseDirectory + "Exceptions\\ExceptionDetails_" + String.Format("{0:MM/dd/yyyy}", DateTime.Now).Replace("/", "") + ".log";
        static ExceptionHelper m_objExceptionHandler;

        private ExceptionHelper()
        {
        }

        public static ExceptionHelper Instance()
        {
            if (m_objExceptionHandler == null)
            {
                m_objExceptionHandler = new ExceptionHelper();
            }
            return m_objExceptionHandler;
        }



        /// <summary>
        /// Private function which shall open up the Stream for writing the details to the text file.
        /// </summary>
        private static void OpenStream()
        {

            if (objBugStream == null)
            {
                if (m_strPath.Trim().Length > 0)
                {

                    if (!Directory.Exists(System.AppDomain.CurrentDomain.BaseDirectory + "Exceptions\\"))
                    {
                        Directory.CreateDirectory(System.AppDomain.CurrentDomain.BaseDirectory + "Exceptions\\");
                    }
                    objBugStream = new StreamWriter(m_strPath, true, System.Text.Encoding.ASCII);

                }
            }
        }

        /// <summary>
        /// Overloaded function which shall be used for logging the Exceptions
        /// </summary>
        /// <param name="Source"></param>
        /// <param name="Description"></param>
        /// <param name="ForcefulLogging"></param>
        public static void ExceptionLogging(string Source, string Description, bool ForcefulLogging)
        {
            try
            {
                OpenStream();
                WriteToFile(Source, Description);
                if (ForcefulLogging)
                {
                    throw new Exception(Description);
                    throw new Exception("Message : " + Description + " Stack Trace : " + Source);
                }
            }
            catch (Exception exBugsHandling)
            {
                throw exBugsHandling;

            }
        }
       

        /// <summary>
        /// This shall be privately function which shall be used by the functions.
        /// </summary>
        /// <param name="SourceofBug"></param>
        /// <param name="DescriptionofBug"></param>
        private static void WriteToFile(string SourceofBug, string DescriptionofBug)
        {
            if (objBugStream == null)
            {
                OpenStream();
            }

            Monitor.Enter(objBugStream);

            try
            {
                //string stMsg = null;
                string strReportedOn = "Reported on " + System.DateTime.Now.ToString();
                objBugStream.WriteLine();
                objBugStream.WriteLine("*********");
                objBugStream.WriteLine(strReportedOn);
                string strHash = "";
                strHash = strHash.PadLeft(strReportedOn.Length, char.Parse("-"));
                objBugStream.WriteLine(strHash);
                if (SourceofBug != null)
                {
                    objBugStream.WriteLine("Source: " + SourceofBug);
                }
                objBugStream.WriteLine("Description: " + DescriptionofBug);
                objBugStream.WriteLine("*The End*");
                objBugStream.Flush();
            }
            catch
            {
            }
            finally
            {
                Monitor.Exit(objBugStream);
            }
            if (objBugStream != null)
            {
                objBugStream.Close();
                objBugStream = null;
            }

        }

    }










}