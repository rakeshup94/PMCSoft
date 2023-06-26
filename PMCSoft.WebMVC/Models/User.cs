using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using INGM.Core.ViewModel;
using INGM.Core.Common;
using INGM.Core.ViewModel.Address;
using INGM.Core.ViewModel.Users;

namespace INGM.Web.Models
{
    public class User
    {

        [Required]
        public string Email { get; set; }
        [Required]
        public string Password { get; set; }

        public int? Android { get; set; }
        public bool RememberMe { get; set; }

    }
    //Rajiv

    public class ForgotPassword
    {
        [Required]
        public string Email { get; set; }


        public ForgotPassword()
        { }


    }

    public class ResetPasswordViewmodel
    {
        public long UserId { get; set; }
        [Required]
        public string userName { get; set; }
        [Required]
        [StringLength(100, ErrorMessage = "The {0} must be at least {2} characters long.", MinimumLength = 6)]
        [DataType(DataType.Password)]
        // [RegularExpression(@"^.(?=.{8,})(?=.[a-z])(?=.[A-Z])(?=.[\d\W]).*$", ErrorMessage = "Password must contain at least 8 characters, including UPPER/lowercase,special character and numbers ")]  
        public string Password { get; set; }

        [DataType(DataType.Password)]
        [Compare("Password", ErrorMessage = "The password and confirmation password do not match.")]
        public string ConfirmPassword { get; set; }

        public ResetPasswordViewmodel()
        { }
        public ResetPasswordViewmodel(string username)
        {
            userName = username;
        }
        public ResetPasswordViewmodel(string username, long userid)
        {
            UserId = userid;
            userName = username;
        }
    }
    public class UserLogin
    {
        public User User { get; set; }
        public ForgotPasswordSecure ForgotPassword { get; set; }
        public UserRegister Register { get; set; }
        public UserLogin()
        {
            User = new User();
            ForgotPassword = new ForgotPasswordSecure();
            Register = new UserRegister();
        }
    }
    public class UserRegister
    {
        public BusinessEnityInfo BusinessEnityInfo { get; set; }

        [Display(Name = "Company Name")]
        [Required]
        public string CompanyName { get; set; }

        [Display(Name = "Subject")]
        [Required]
        public string Subject { get; set; }

        [Display(Name = "Property Name")]
        [Required]
        public string HotelName { get; set; }
        public Title Title { get; set; }

        [Display(Name = "First Name")]
        [Required]
        public string FirstName { get; set; }
        [Display(Name = "Middle Name")]
        public string MiddleName { get; set; }
        [Display(Name = "Last Name")]
        [Required]
        public string LastName { get; set; }
        
        [Display(Name = "Designation")]
        public string Designation { get; set; }
        public PersonAddress Address { get; set; }

        [Display(Name = "Zip Code")]
        public string PinCode { get; set; }
        [Display(Name = "Mobile Number")]
        public string MobileNum { get; set; }
        [Display(Name = "Phone Number")]
        public string PhoneNum { get; set; }
        [Display(Name = "Email")]
        [Required]
        public string Email { get; set; }
        [Display(Name = "IATA No.")]
        public string IataNum { get; set; }
        [Display(Name = "Address")]
        public string guestAddress { get; set; }

        [Display(Name = "Tell us more about yourself")]
        public string Description { get; set; }

        [Display(Name = "PrefferedAccounting")]
        public PrefferedAccounting PrefferedAccounting { get; set; }

        [Display(Name = "Star Rating")]
        public StarRating StarRating { get; set; }

        [Display(Name = "Property Type")]
        public PropertyType PropertyType { get; set; }

        [Display(Name = "Please Upload License")]
        public string License { get; set; }
        public string Registrar { get; set; }

        [Display(Name = "Credit Type")]
        public bool CreditBasic { get; set; }
        [Display(Name = "Cash Type")]
        public bool CashBasic { get; set; }
        public UserRegister()
        {
            BusinessEnityInfo = new BusinessEnityInfo();
        }

    }

}