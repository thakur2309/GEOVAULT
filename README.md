# 🚨 GEO-VAULT — *LOCATION TRACKING TOOL* 

![Status: Lab Only](https://img.shields.io/badge/Status-Lab--Only-yellow?style=for-the-badge) ![Made with ❤️](https://img.shields.io/badge/Author-Firewall%20Breaker-blue?style=for-the-badge)

> **Short description:** A polished front‑end demo that showcases browser geolocation flows, animated UI, and safe local logging for educational and defensive research. **This repository is explicitly for lab use and learning — it does not implement real exploitation techniques.**

---

## 🎯 Project purpose

WiFi HACK X is a **visual simulation** that demonstrates how a modern, animated cybersecurity UI can request permissions, display progress and notifications, and POST location data to a local logger for research. It is built to teach UX, consent flows, and privacy-aware logging — not to perform or instruct unauthorized access.

---

## 🔎 Files of interest (from your `index.html`)

* `index.html` — Front‑end demo containing:

  * Animated header and background video (`#earth`) using a Mixkit asset.
  * A matrix rain canvas and flying node animations for visual flair.
  * A permission popup that requests **geolocation** (`navigator.geolocation.getCurrentPosition`).
  * A `fetch('save_location.php', ...)` call that POSTs `lat`, `lon`, `acc`, `ip` and `time` to a local endpoint.
  * Fake/placeholder "hack" messages and simulated password cards (intended as demo content).
  * Share buttons and promotional flows (YouTube/Instagram link and a simulated premium upsell UI).
  * Audio feedback and notification rotation for live effect.

> ⚠️ Note: `save_location.php` was referenced in the front‑end. If present, ensure it only logs to a local file and is not publicly exposed.

---

## ⚖️ Safety & Legal Disclaimer

* **Do not** use this project to collect data from devices you do not own or from users without explicit, documented consent. Doing so may be illegal and unethical.
* The demo intentionally contains **mocked output** (fake passwords, fake hack success messages). Keep such content clearly labeled as `SAMPLE` in any public version.
* If you want to publish a public demo, implement an explicit consent workflow, remove any impersonation or claims of real compromise, and present only sanitized sample data.

---

## ✅ Recommended safe setup (local / development only)

1. Clone repo and run a local static server (example using Python):

```bash
python -m http.server 8000
# open http://localhost:8000
```

2. If you need the PHP logger for research **on your machine only**:

```bash
php -S localhost:8001
# open http://localhost:8001
```

3. Test on devices you own. Inspect the saved logs locally and verify no sensitive real data is stored or transmitted externally.

---

## 🧭 How the demo behaves (high level — safe)

* When the user clicks **SCAN NETWORK**, the UI shows a permission popup. If the user allows, `navigator.geolocation.getCurrentPosition` is used to capture coordinates (client‑side), and the front‑end then POSTs those coordinates to `save_location.php` on the same host.
* Immediately after, the UI runs a scripted sequence of fake log messages and reveals **simulated** password cards — purely for UX demonstration.
* The share buttons and promotional flow are standard front‑end actions (WhatsApp, Telegram, copy‑to‑clipboard for Instagram).

---

## 🛠️ Suggested privacy & safety improvements (practical)

1. **Explicit consent checkbox + record consent** before collecting geolocation. Log consent with timestamp and a SHA256 signature of the form data (locally) so you can demonstrate consent without exposing extra PII.

```html
<!-- minimal consent flow snippet (frontend) -->
<label><input type="checkbox" id="consent"> I consent to share my location for demo purposes</label>
<button id="scanBtn">Scan Network</button>
<script>
  document.getElementById('scanBtn').onclick = () => {
    if(!document.getElementById('consent').checked){
      alert('Please give consent first'); return;
    }
    // proceed to request geolocation
  }
</script>
```

2. **Sanitize and reduce precision**: store coordinates rounded to 3 decimal places (≈100m) when demonstrating privacy‑preserving options.
3. **Label demo data**: prefix any fake password or sample device name with `SAMPLE_` so researchers and reviewers cannot misinterpret output.
4. **Local-only logging & auth**: keep `save_location.php` behind localhost and do not deploy it to a public server without strict authentication, HTTPS, and legal review.

---

## 🧩 UX / Branding & Animated Assets

* The current `index.html` uses a Mixkit video and a remote audio file. For a polished repo:

  * Replace remote assets with local copies included under `assets/` with license notes.
  * Add a small GIF (≤2–3MB) showing the UI for the README header and a branded SVG logo.
  * Use Shields badges for `License`, `Status: Lab Only`, and `Contact`.

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
  <img src="https://img.shields.io/badge/instagram-FF0000?style=for-the-badge&logo=instagram&logoColor=white" alt="Instagram">
</a>  
<br>  
