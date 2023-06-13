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
    public class ElektroGitarController : Controller
    {

        private mmagazaEntities db=new mmagazaEntities();

        public ActionResult Index(int sayfa=1)
        {

            var urunler = db.tbl_urun.Where(u => u.tbl_kategori.KategoriID == 1).ToList().ToPagedList(sayfa, 7);
            return View(urunler);

        }



        public ActionResult Getir(int id)
        {
            var urun = db.tbl_urun.FirstOrDefault(u => u.UrunID == id);

            if (urun == null)
            {
               
                return RedirectToAction("Index"); 
            }

            return View(urun);
        }





    }
}