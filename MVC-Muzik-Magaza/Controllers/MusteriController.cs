using MVC_Muzik_Magaza.Models;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MVC_Muzik_Magaza.Controllers
{
    public class MusteriController : Controller
    {


        private mmagazaEntities db=new mmagazaEntities();


        // GET: Musteri
        public ActionResult Index(int sayfa = 1)
        {
            var musteriler = db.tbl_musteri.ToList().ToPagedList(sayfa, 7);
            return View(musteriler);
        }

        public ActionResult Yenimusteri()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Yenimusteri(tbl_musteri p1)
        {
            if (!ModelState.IsValid)
            {
                return View("Yenimusteri");
            }
            db.tbl_musteri.Add(p1);
            db.SaveChanges();
            return RedirectToAction("Index");
        }



        public ActionResult Sil(int id)
        {
            var müsteri = db.tbl_musteri.Find(id);
            db.tbl_musteri.Remove(müsteri);
            db.SaveChanges();
            return RedirectToAction("Index");
        }


        public ActionResult Musterigetir(int id)
        {
            var müsteri = db.tbl_musteri.Find(id);
            return View("Musterigetir", müsteri);
        }

        public ActionResult Guncelle(tbl_musteri p1)
        {
            var must = db.tbl_musteri.Find(p1.MusteriID);
            must.MusteriAdsoyad = p1.MusteriAdsoyad;
            must.Telno = p1.Telno;
            must.TC = p1.TC;
            must.Adres = p1.Adres;
            must.KulAdi = p1.KulAdi;
            must.Sifre = p1.Sifre;
            must.Sehir = p1.Sehir;
            must.Yetki = p1.Yetki;  
            db.SaveChanges();
            return RedirectToAction("Index");
        }













    }
}