﻿
using PMCSoft.Core.Models.Navigation;
using System;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Text.RegularExpressions;


namespace PMCSoft.Core.Common
{
    public static class Extensions
    {
   



        public static IEnumerable<Dictionary<string, object>> ToEnumerable(this IDataReader reader)
        {
            while (reader.Read())
            {
                Dictionary<string, object> result = new Dictionary<string, object>();
                for (int column = 0; column < reader.FieldCount; column++)
                    result.Add(reader.GetName(column), reader.GetValue(column));
                yield return result;
            }
        }
        public static DataTable ToDataTable<T>(this List<T> dataList) where T : class
        {
            Type t = typeof(T);
            DataTable dt = new DataTable(t.Name);
            dt.Columns.Add("Id", typeof(int));
            dt.Columns["Id"].AutoIncrement = true;
            dt.Columns["Id"].AutoIncrementSeed = 1;
            dt.Columns["Id"].AutoIncrementStep = 1;
            foreach (System.Reflection.PropertyInfo pi in t.GetProperties())
            {
                dt.Columns.Add(new DataColumn(pi.Name));
            }
            if (dataList != null)
            {
                foreach (T item in dataList)
                {
                    DataRow dr = dt.NewRow();
                    foreach (DataColumn dc in dt.Columns)
                    {
                        if (dc.ColumnName.Trim() != "ID")
                        {
                            dr[dc.ColumnName] = item.GetType().GetProperty(dc.ColumnName).GetValue(item, null);
                        }
                    }
                    dt.Rows.Add(dr);
                }
            }
            return dt;
        }

        public static IList<T> EmptyList<T>(this IList<T> list)
        {
            return list ?? new List<T>();
        }

        public static bool HasValue<T>(this List<T> items)
        {
            if (items != null)
            {
                if (items.Count() > 0)
                {
                    return true;
                }
            }
            return false;
        }

        public static void ConvertSourceToTarget<T, S>(T target, S source)
        {
            var properties = from prop in source.GetType().GetProperties()
                             select prop;

            foreach (PropertyInfo property in properties)
            {
                dynamic propertyValue = property.GetValue(source, null);
                PropertyInfo tProperty = target.GetType().GetProperties().Where(x => x.Name == property.Name).FirstOrDefault();

                if (propertyValue != null && tProperty != null)
                {
                    var propertyType = property.PropertyType.FullName;
                    if (property.PropertyType.IsGenericType && property.PropertyType.GetGenericTypeDefinition() == typeof(Nullable<>))
                    {
                        propertyType = property.PropertyType.GetGenericArguments()[0].FullName;
                    }
                    switch (propertyType)
                    {
                        case "System.Int32":
                            {
                                tProperty.SetValue(target, Convert.ToInt32(propertyValue), null);
                                break;
                            }
                        case "System.Nullable[System.Int32]":
                            {
                                tProperty.SetValue(target, Convert.ToInt32(propertyValue), null);
                                break;
                            }
                        case "System.Int64":
                            {
                                tProperty.SetValue(target, Convert.ToInt64(propertyValue), null);
                                break;
                            }
                        case "System.Boolean":
                            {
                                tProperty.SetValue(target, Convert.ToBoolean(Convert.ToInt16(propertyValue)), null);
                                break;
                            }
                        case "System.String":
                            {
                                tProperty.SetValue(target, propertyValue, null);
                                break;
                            }
                        case "System.DateTime":
                            {
                                tProperty.SetValue(target, Convert.ToDateTime(propertyValue), null);
                                break;
                            }
                        case "System.Decimal":
                            {
                                tProperty.SetValue(target, Math.Round(Convert.ToDecimal(propertyValue), 2), null);
                                break;
                            }
                        case "System.Double":
                            {
                                tProperty.SetValue(target, Math.Round(Convert.ToDouble(propertyValue), 2), null);
                                break;
                            }
                        default:
                            {
                                if (!property.PropertyType.Name.Contains("List") && !property.PropertyType.Name.Contains("Collection"))
                                {
                                    Type t = Enum.GetUnderlyingType(property.PropertyType);
                                    switch (t.FullName)
                                    {
                                        case "System.Int16":
                                            {
                                                tProperty.SetValue(target, Convert.ToInt16(propertyValue), null);
                                                break;
                                            }
                                        case "System.Int32":
                                            {
                                                tProperty.SetValue(target, Convert.ToInt32(propertyValue), null);
                                                break;
                                            }
                                    }
                                }
                                break;
                            }
                    }
                }
            }
        }

    }



    public static partial class LinqExtensions
    {
        /// <summary>
        /// Return self and traverse a chain of same items types using a selector to next.
        /// </summary>
        /// <typeparam name="T">the item type</typeparam>
        /// <param name="source">The head of chain.</param>
        /// <param name="TraverseBy">The selector to the next item in chain.</param>
        /// <returns>self and next items</returns>
        static public IEnumerable<T> SelfAndTraverse<T>(this T source,
                                                        Func<T, T> TraverseBy)
        {
            if (source == null)
                yield break;

            yield return source;

            var children = TraverseBy(source);
            if (children == null)
                yield break;

            foreach (var child in children.SelfAndTraverse(TraverseBy))
            {
                yield return child;
            }
        }

        /// <summary>
        /// Traverse a chain of same items types using a selector to next.
        /// </summary>
        /// <typeparam name="T">the item type</typeparam>
        /// <param name="source">The head of chain.</param>
        /// <param name="TraverseBy">The selector to the next item in chain.</param>
        /// <returns>the next items</returns>
        static public IEnumerable<T> Traverse<T>(this T source,
                                                 Func<T, T> TraverseBy)
        {
            if (source == null)
                yield break;

            var children = TraverseBy(source);
            if (children == null)
                yield break;

            foreach (var child in children.SelfAndTraverse(TraverseBy))
            {
                yield return child;
            }
        }
    }

}










