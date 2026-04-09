// O++ Derleyici Çekirdeği - ARM64 Başlangıç Noktası
.global _start

.section .data
    msg:    .ascii "O++ v0.1: Sistem Hazir\n"
    len = . - msg

.section .text
_start:
    // Ekrana Yazdır (sys_write)
    mov x0, #1          // 1 = stdout (ekran)
    ldr x1, =msg        // Mesajın adresi
    ldr x2, =len        // Mesajın uzunluğu
    mov x8, #64         // 64 = Linux/Android write syscall
    svc #0              // Çekirdeğe komutu gönder

    // Programdan Çık (sys_exit)
    mov x0, #0          // Hata kodu 0
    mov x8, #93         // 93 = exit syscall
    svc #0              // Çekirdeğe komutu gönder
