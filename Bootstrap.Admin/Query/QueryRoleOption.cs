﻿using Bootstrap.DataAccess;
using Longbow.Web.Mvc;
using System.Linq;

namespace Bootstrap.Admin.Query
{
    /// <summary>
    /// 
    /// </summary>
    public class QueryRoleOption : PaginationOption
    {
        /// <summary>
        /// 
        /// </summary>
        public string RoleName { get; set; }
        /// <summary>
        /// 
        /// </summary>
        public string Description { get; set; }
        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public QueryData<object> RetrieveData()
        {
            // int limit, int offset, string name, string price, string sort, string order
            var data = RoleHelper.Retrieves();
            if (!string.IsNullOrEmpty(RoleName))
            {
                data = data.Where(t => t.RoleName.Contains(RoleName));
            }
            if (!string.IsNullOrEmpty(Description))
            {
                data = data.Where(t => t.Description.Contains(Description));
            }
            var ret = new QueryData<object>();
            ret.total = data.Count();
            data = Order == "asc" ? data.OrderBy(t => t.RoleName) : data.OrderByDescending(t => t.RoleName);
            ret.rows = data.Skip(Offset).Take(Limit).Select(r => new { r.Id, r.RoleName, r.Description });
            return ret;
        }
    }
}