# آموزش راه‌اندازی Rathole Watchdog 🛠

این راهنما به شما کمک می‌کند تا اسکریپت واچ‌داگ `rathole` را نصب، اجرا و مدیریت کنید.

---

## 🧾 پیش‌نیازها

- نصب بودن bash و curl
- نصب بودن `rathole` در مسیر `/root/rathole-core`
- دسترسی root یا sudo

---

## 1️⃣ دانلود پروژه

```bash
git clone https://github.com/your-username/rathole-watchdog.git
cd rathole-watchdog
```

---

## 2️⃣ اجرای اولیه اسکریپت

```bash
chmod +x rathole_watchdog.sh
sudo ./rathole_watchdog.sh
```

در اولین اجرا:

- IP و پورت سرور مقصد از شما پرسیده می‌شود.
- این اطلاعات در فایلی به نام `rathole_watchdog.conf` ذخیره می‌شود.
- سپس اسکریپت شروع به بررسی اتصال خواهد کرد.

---

## 3️⃣ ساخت خودکار سرویس systemd

اسکریپت به طور خودکار یک فایل سرویس به مسیر زیر اضافه می‌کند:

```
/etc/systemd/system/rathole_watchdog.service
```

سپس این سرویس فعال و راه‌اندازی می‌شود تا همیشه در حال اجرا باشد.

---

## 4️⃣ بررسی وضعیت سرویس

برای بررسی وضعیت واچ‌داگ:

```bash
systemctl status rathole_watchdog.service
```

برای توقف موقت:

```bash
sudo systemctl stop rathole_watchdog.service
```

برای غیرفعال‌سازی دائمی:

```bash
sudo systemctl disable rathole_watchdog.service
```

---

## ✅ نکته مهم

مطمئن شوید مسیر `RATHOLE_DIR` در اسکریپت با مسیر نصب `rathole` شما یکی باشد. در صورت نیاز آن را ویرایش کنید.

---

با آرزوی موفقیت ❤️  
*طراحی شده توسط آقا ناصر عزیز، اسکریپت‌نویسی توسط باقری*
