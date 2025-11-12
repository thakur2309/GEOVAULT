# 🚨 GEO-VAULT — *LOCATION TRACKING TOOL* 

![Status: Lab Only](https://img.shields.io/badge/Status-Lab--Only-yellow?style=for-the-badge) ![Made with ❤️](https://img.shields.io/badge/Author-Firewall%20Breaker-blue?style=for-the-badge)

> **Short description:** **GeoVault** is an educational location-tracking demonstration project designed for 
students and cybersecurity learners who want to understand how browser-based 
geolocation works in real environments.  

The tool shows how a user’s device can share approximate latitude, longitude, 
accuracy, and IP details *only after* the user explicitly grants permission 
through the browser’s built-in location API.

The goal is to teach how ethical hackers, penetration testers, and researchers 
can study web-based tracking mechanisms responsibly — by hosting everything 
locally and focusing on consent, privacy, and data awareness.  

🧩 GeoVault is **not a spying or hacking tool** — it is built to raise awareness, 
improve ethical understanding, and promote cybersecurity education through 
controlled and consent-based demonstrations.

---

## 🎯 Project purpose

The main purpose of the **GeoVault** project is to demonstrate how web browsers handle 
location permission requests and how backend scripts can safely log such data for 
educational or research use.

It was built as part of a cybersecurity awareness and ethical hacking learning module.  
The tool visually explains:
- How geolocation APIs in browsers work.
- How front-end JavaScript interacts with back-end scripts (like PHP) to log data.
- How ethical hackers and security researchers study such data flows responsibly.
- How consent and safe local hosting can be enforced in a demo.
---
## 💻 Platform Support

GeoVault is designed to run smoothly on the following platforms:

### 🟢 Termux (Android)
- Fully supported.
- Optimized for mobile ethical hacking and quick demonstrations.
- Includes Termux-specific features like `termux-clipboard-set` and `termux-toast` (optional).

### 🟣 Linux (Debian / Ubuntu / Kali)
- Fully compatible.
- Recommended for desktop or virtual machine environments.
- Supports manual installation of all dependencies using apt.

### ⚪ Other Platforms
- macOS and Windows (via WSL or XAMPP) may partially support the PHP server, 
  but **official support** is limited to Termux and Linux only.

## ⚖️ Safety & Legal Disclaimer

⚠️ This project is created purely for **educational, ethical, and research purposes** — 
to help students and cybersecurity learners understand web-based tracking mechanisms 
without violating privacy laws or collecting unauthorized user information.

---

## Installation 🛠️
## 🐧 Linux Setup (Kali/Ubuntu/Debian)
```bash
sudo apt update

git clone https://github.com/thakur2309/GEOVAULT.git
cd GEOVAULT

# run script
bash geovault.sh
```

## 🧭 How the demo behaves (high level — safe)

* When the user clicks **SCAN NETWORK**, the UI shows a permission popup. If the user allows, `navigator.geolocation.getCurrentPosition` is used to capture coordinates (client‑side), and the front‑end then POSTs those coordinates to `save_location.php` on the same host.
* Immediately after, the UI runs a scripted sequence of fake log messages and reveals **simulated** password cards — purely for UX demonstration.
* The share buttons and promotional flow are standard front‑end actions (WhatsApp, Telegram, copy‑to‑clipboard for Instagram).

---

## 🤝 Contribution & Responsible Disclosure

Contributions are welcome if they improve safety, clarity, or accessibility. Please **do not** submit code that automates unauthorized data collection or adds exploit techniques.

If you discover a privacy or security issue in this demo, open a private issue or contact the maintainer via the repository contact details.

Suggested PR flow:

1. Fork the repo. 2. Create a branch `feat/safe-consent` or `fix/sanitize-logs`. 3. Open PR with clear tests and description.

---

## 📜 License

Use a permissive open‑source license for educational work, for example MIT. Add a `LICENSE` file to the repo.

---

## ⚠️ Disclaimer
This tool is intended **only for educational and lawful use** on devices **you own** or have **explicit permission** to manage. The creator and contributors are **not responsible** for any misuse.  
Stay ethical — **Firewall Breaker** community promotes **learning & safety**, not harm.

---

👨‍💻 **Author**  
- Made with ❤️ by **thakur2309** 
- Name: **Alok Thakur**  
- YouTube: [🔥 Firewall Breaker](https://www.youtube.com/@FirewallBreaker09)

---
## 📬 Contact 

<a href="https://youtube.com/@firewallbreaker09">
  <img src="https://img.shields.io/badge/YouTube-FF0000?style=for-the-badge&logo=youtube&logoColor=white" alt="YouTube">
</a>  
<br>  

<a href="https://github.com/thakur2309?tab=repositories">
  <img src="https://img.shields.io/badge/GitHub-000000?style=for-the-badge&logo=github&logoColor=white" alt="GitHub">
</a>  
<br>  

<a href="https://whatsapp.com/channel/0029VbAiqVMKLaHjg5J1Nm2F">
  <img src="https://img.shields.io/badge/WhatsApp-25D366?style=for-the-badge&logo=whatsapp&logoColor=white" alt="WhatsApp Channel">
</a>
<br>
<a href="https://www.instagram.com/sudo_xploit?igsh=MWN0YWc3N2JyenhoNw==">
  <img src="https://img.shields.io/badge/instagram-F56040?style=for-the-badge&logo=instagram&logoColor=white" alt="Instagram">
</a>  
<br>  
