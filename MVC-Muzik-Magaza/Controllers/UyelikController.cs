using MVC_Muzik_Magaza.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PagedList;
using System.Security.Permissions;
using System.Web.Security;

namespace MVC_Muzik_Magaza.Controllers
{
    public class UyelikController : Controller
    {



        private mmagazaEntities db = new mmagazaEntities();
        // GET: KullaniciAnasayfa
        public ActionResult Index()
        {

        return View();

        }







        public ActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Create(tbl_musteri yenimusteri)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    yenimusteri.Yetki=false;

                    db.tbl_musteri.Add(yenimusteri);
                    db.SaveChanges();


                    return RedirectToAction("Girisyap", "Uyelik");
                }
                catch (Exception ex)
                {

                    ModelState.AddModelError("", "Üyelik oluşturulamadı. Bir hata oluştu: " + ex.Message);
                }
            }


            return View(yenimusteri);
        }


        public ActionResult Girisyap()
        {
            return View();
        }




        [HttpPost]
        public ActionResult Girisyap(tbl_musteri giris)
        {
            var kullanici = db.tbl_musteri.FirstOrDefault(m => m.KulAdi == giris.KulAdi && m.Sifre == giris.Sifre);

            if (kullanici != null)
            {

                Session["KullaniciID"] = kullanici.MusteriID;
                Session["KullaniciAdi"] = kullanici.MusteriAdsoyad;

                
                
                if(kullanici.Yetki==true)
                {
                    return RedirectToAction("Index", "Home");
                }
                else
                {
                    return RedirectToAction("Index", "KullaniciAnasayfa");
                }


            
            }
            else
            {
                ViewBag.Hata = "Kullanıcı adı veya şifre yanlış";
            }

            return View();
        }


        public ActionResult Cikisyap()
        {
            Session["KullaniciAdi"] = null;
            Session["KullaniciID"] = null;
            return RedirectToAction("Create", "Uyelik");
        }









    }
}