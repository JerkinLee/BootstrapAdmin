﻿using Bootstrap.DataAccess;
using Longbow.Web.Mvc;
using System.Linq;

namespace Bootstrap.Admin.Models
{
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
        public QueryData<Role> RetrieveData()
        {
            // int limit, int offset, string name, string price, string sort, string order
            var data = RoleHelper.RetrieveRoles(string.Empty);
            if (!string.IsNullOrEmpty(RoleName))
            {
                data = data.Where(t => t.RoleName.Contains(RoleName));
            }
            if (!string.IsNullOrEmpty(Description))
            {
                data = data.Where(t => t.Description.Contains(Description));
            }
            var ret = new QueryData<Role>();
            ret.total = data.Count();
            // TODO: 通过option.Sort属性判断对那列进行排序，现在统一对名称列排序
            data = Order == "asc" ? data.OrderBy(t => t.RoleName) : data.OrderByDescending(t => t.RoleName);
            ret.rows = data.Skip(Offset).Take(Limit);
            return ret;
        }
    }
}