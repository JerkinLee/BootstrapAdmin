﻿using Bootstrap.Admin.Models;
using System.Web.Mvc;

namespace Bootstrap.Admin.Controllers
{
    /// <summary>
    /// 
    /// </summary>
    public class AdminController : Controller
    {
        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public ActionResult Index()
        {
            var v = new NavigatorBarModel();
            v.ShowMenu = "hide";
            v.HomeUrl = "~/Admin";
            return View(v);
        }
        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public ActionResult Users()
        {
            var v = new NavigatorBarModel();
            v.BreadcrumbName = "用户管理";
            v.ShowMenu = "hide";
            v.Menus[1].Active = "active";
            v.HomeUrl = "~/Admin";
            return View(v);
        }
        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        [AllowAnonymous]
        public ActionResult FAIcon()
        {
            return View();
        }
    }
}
