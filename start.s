// ==========================================
// O++ Core - ARM64 Native Assembly (Debian/Ubuntu)
// ByWerton - 2026
// ==========================================

.section .data
    // Ekrana yazılacak mesaj
    msg:    .ascii "O++: Sistem Baslatildi\n"
    len = . - msg

.section .text
.global _start

_start:
    // ------------------------------------------
    // 1. ADIM: Ekrana Yazdır (sys_write)
    // Registerlar: x0=fd, x1=buf, x2=count, x8=syscall_num
    // ------------------------------------------
    mov x0, #1          // 1 = Standart çıktı (stdout)
    ldr x1, =msg        // Mesajın bellek adresi
    mov x2, #23         // Mesaj uzunluğu (O++: Sistem Baslatildi\n = 23 karakter)
    mov x8, #64         // ARM64 Linux/Debian'da sys_write syscall numarası
    svc #0              // Çekirdeği çağır (Supervisor Call)

    // ------------------------------------------
    // 2. ADIM: Programdan Çık (sys_exit)
    // Registerlar: x0=error_code, x8=syscall_num
    // ------------------------------------------
    mov x0, #0          // Hata kodu 0 (Başarılı)
    mov x8, #93         // ARM64 Linux/Debian'da sys_exit syscall numarası
    svc #0              // Çekirdeği çağır ve programı bitir
