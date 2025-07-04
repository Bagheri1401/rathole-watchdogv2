# Rathole Watchdog 🕵️‍♂️

> طراحی شده توسط **آقا ناصر عزیز**  
> اسکریپت‌نویسی توسط **باقری**

اسکریپتی برای نظارت بر اتصال `rathole` و راه‌اندازی مجدد خودکار در صورت قطع شدن ارتباط.

---

## ✨ ویژگی‌ها

- نظارت بر اتصال با `curl`
- راه‌اندازی مجدد سرویس در صورت نیاز
- اجرای دائمی با systemd
- پیکربندی ساده (فقط IP و پورت)

---

## 🔧 نصب

```bash
git clone https://github.com/your-username/rathole-watchdog.git
cd rathole-watchdog
```

---

## 🎯 اجرای اولیه اسکریپت

```bash
chmod +x rathole_watchdog.sh
sudo ./rathole_watchdog.sh
```

در اولین اجرا، IP و پورت سرور مقصد از شما پرسیده می‌شود و فایل سرویس systemd نیز به صورت خودکار ساخته خواهد شد.

---

## 🔁 اجرای خودکار با systemd

پس از اجرای اولیه، فایل سرویس systemd ساخته می‌شود:

```bash
systemctl status rathole_watchdog.service
```

---

## 🛡 لایسنس

MIT License - استفاده آزاد برای همه.

---

## 🙏 طراحی و توسعه

- 🎨 طراحی: **آقا ناصر عزیز**
- 💻 توسعه: **باقری**
