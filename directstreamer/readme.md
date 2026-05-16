## ✨ Features

**DirectStreamer** is built for extreme efficiency and a zero-distraction cinematic experience. It relies on a lightweight Go backend and a heavily optimized ExoPlayer client to deliver 4K Remuxes flawlessly over standard local networks.

### ⚙️ The Engine (Go Backend)
* **Direct Play Architecture:** Bypasses CPU-heavy real-time transcoding entirely. Serves raw `.mkv` and `.mp4` files via HTTP Range Requests for 0% CPU overhead, instantaneous video startup, and zero-latency seeking.
* **In-Memory Media Cache:** A background worker recursively scans your media library every 5 minutes and caches the index to RAM. API requests from the TV are served instantly with **zero disk I/O**.
* **Chronological Sorting:** Automatically reads file modification metadata to push your newest movies and episodes to the top of the grid.
* **Integrated Distribution:** Features a built-in web server that hosts the compiled Android TV APK, making installation as simple as navigating to a local URL.

### 📺 The Client (Android TV / Kotlin)
* **Native Dolby Vision & HDR10:** Reads enhancement layer metadata directly from the file header, bypassing Android OS tunneling limitations to guarantee Dolby Vision triggers on high-end displays (like LG OLEDs).
* **Smart Decoder Fallback:** Attempts primary hardware decoding first, but intelligently falls back to secondary or software decoding if the TV's SoC rejects the format (preventing black screens on 4K 60fps files).
* **Deep Network Buffering:** Pre-configured with a massive 150MB ExoPlayer buffer to absorb network latency and bandwidth dips, ensuring smooth 4K playback even over standard Wi-Fi or USB 2.0 Ethernet adapters.
* **Cinematic "Zero-UI" Experience:** Forces a pure black background and permanently hides all on-screen playback controls for a distraction-free environment. 
* **Hardware Remote Integration:** Maps physical remote buttons (D-Pad Center, Play/Pause, Enter, Space) directly to the video state for seamless pausing without UI overlays.
* **Intelligent Screensaver Management:** Explicitly commands the Android Window Manager to keep the screen awake during playback, but restores the system screensaver when paused to prevent OLED burn-in.

### 🐳 Infrastructure & Deployment
* **Automated Multi-Stage Build:** A single `docker compose up` command manages the entire pipeline—it pulls the Go compiler, downloads the Android SDK, builds the backend, compiles the Android APK, and packages it all into a lightweight Alpine Linux runtime.
* **Dynamic IP Injection:** Uses Gradle's `BuildConfig` and a centralized `.env` file to automatically bake your server's IP and port directly into the compiled app. No hardcoding required.
