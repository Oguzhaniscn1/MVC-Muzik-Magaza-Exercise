using MVC_Muzik_Magaza.Models;
using PagedList;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MVC_Muzik_Magaza.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            ViewBag.message = "Yönetim paneline hoş geldiniz.";
            return View();
        }


    }
}