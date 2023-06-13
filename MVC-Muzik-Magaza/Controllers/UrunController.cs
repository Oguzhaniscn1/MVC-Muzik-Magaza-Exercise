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
    public class UrunController : Controller
    {
        private mmagazaEntities db=new mmagazaEntities();





        // GET: Urun
        public ActionResult Index(int sayfa = 1)
        {
            var urunler = db.tbl_urun.ToList().ToPagedList(sayfa, 7);
            return View(urunler);
        }


        [HttpGet]
        public ActionResult Urunekle()
        {
            List<SelectListItem> kategoriler = (from i in db.tbl_kategori.ToList()
                                                select new SelectListItem
                                                {
                                                    Text = i.KategoriAd,
                                                    Value = i.KategoriID.ToString()
                                                }).ToList();
            ViewBag.ktgr = kategoriler;
            return View();
        }

        [HttpPost]
        public ActionResult Urunekle(tbl_urun p1, HttpPostedFileBase ImagePath)
        {
            if (p1.Urunad == null || p1.Marka == null || p1.UrunFiyat == null || p1.UrunStok == null || p1.ImagePath == null)
            {
                List<SelectListItem> kategoriler = (from i in db.tbl_kategori.ToList()
                                                    select new SelectListItem
                                                    {
                                                        Text = i.KategoriAd,
                                                        Value = i.KategoriID.ToString()
                                                    }).ToList();
                ViewBag.ktgr = kategoriler;
                return View();
            }
            else
            {
                var image = Path.GetFileName(ImagePath.FileName);
                var path = Path.Combine(Server.MapPath("~/Images"), image);
                ImagePath.SaveAs(path);
                p1.ImagePath = "/Images/" + image;


                var ktg = db.tbl_kategori.Where(m => m.KategoriID == p1.tbl_kategori.KategoriID).FirstOrDefault();
                p1.tbl_kategori = ktg;
                db.tbl_urun.Add(p1);
                db.SaveChanges();
                return RedirectToAction("Index");

            }

        }


        public ActionResult Sil(int id)
        {
            var urun = db.tbl_urun.Find(id);
            db.tbl_urun.Remove(urun);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        public ActionResult Urungetir(int id)
        {
            var urun = db.tbl_urun.Find(id);
            List<SelectListItem> kategoriler = (from i in db.tbl_kategori.ToList()
                                                select new SelectListItem
                                                {
                                                    Text = i.KategoriAd,
                                                    Value = i.KategoriID.ToString()
                                                }).ToList();
            ViewBag.ktgr = kategoriler;
            return View("Urungetir", urun);

        }

        public ActionResult Guncelle(tbl_urun p2, HttpPostedFileBase ImagePath)
        {
            var urun = db.tbl_urun.Find(p2.UrunID);
            urun.Urunad = p2.Urunad;
            urun.Marka = p2.Marka;
            urun.UrunFiyat = p2.UrunFiyat;
            urun.UrunStok = p2.UrunStok;
            urun.UrunAciklama=p2.UrunAciklama;


            var ktg = db.tbl_kategori.Where(m => m.KategoriID == p2.tbl_kategori.KategoriID).FirstOrDefault();
            p2.tbl_kategori = ktg;


            if (p2.ImagePath == null)
            {
                p2.ImagePath = urun.ImagePath;
            }
            else
            {
                var image = Path.GetFileName(ImagePath.FileName);
                var path = Path.Combine(Server.MapPath("~/Images"), image);
                ImagePath.SaveAs(path);
                p2.ImagePath = "/Images/" + image;
                urun.ImagePath = p2.ImagePath;
            }

            db.SaveChangesAsync();
            return RedirectToAction("Index");

        }












    }
}