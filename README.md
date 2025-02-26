🏧 VHDL Vending Machine (Otomat)
Bu proje, VHDL kullanarak geliştirilmiş bir otomat (vending machine) tasarımını içermektedir. Proje Xilinx Vivado üzerinde çalıştırılabilir ve simüle edilebilir.

📌 Proje Açıklaması
Bu otomat modeli, kullanıcının farklı değerlerdeki paraları girmesine ve seçtiği ürünü almasına olanak tanır. Eğer fazla para verilirse, para üstü hesaplanarak iade edilir.

📥 Girişler
coin (2-bit) → Kullanıcının attığı para:
"01" → 25 kuruş
"10" → 50 kuruş
"11" → 1 lira
button (3-bit) → Kullanıcının seçtiği ürün:
"001" → 50 kuruş (Ürün A)
"010" → 75 kuruş (Ürün B)
"011" → 1 lira (Ürün C)
"100" → 1 lira (Ürün D)

📤 Çıkışlar
dispense (4-bit) → Verilen ürün kodu.
change (2-bit) → Para üstü:
"01" → 25 kuruş
"10" → 50 kuruş

🚀 Çalıştırma
Vivado'yu açın ve yeni bir proje oluşturun.
VendingMachine.vhd dosyasını ekleyin.
Simulation (Simülasyon) çalıştırarak devrenin davranışını test edin.
