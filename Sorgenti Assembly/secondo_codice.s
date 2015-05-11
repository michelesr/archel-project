	; dichiarazione delle variabili
	.data

; valore iniziale del numero di nepero (1/0! + 1/1!)
valore:	.float 2

; valori di n! per n = 2, 3, ..., 8
fattoriale: .float 2, 6, 24, 120, 720, 5040, 40320

; valore del dividendo
dividendo: .float 1

	.text
	.global main
main:

	LF F1, valore	          ; caricamento del valore iniziale del numero di nepero in F1
	LF F2, dividendo          ; caricamento del dividento in F2

	LF F3, fattoriale         ; viene caricato il valore di 2! in F3
	DIVF F4, F2, F3           ; viene calcolato 1/2! e il risultato viene salvato in F4
	ADDF F5, F4, F1	          ; nepero = nepero + 1/2!, il risultato viene salvato in F5

	LF F6, fattoriale+0x4     ; viene caricato il valore di 3! in F6
	DIVF F7, F2, F6           ; viene calcolato 1/3! e il risultato viene salvato in F7
	ADDF F8, F7, F5           ; nepero = nepero + 1/3!, il risultato viene salvato in F8

	LF F9, fattoriale+0x8     ; viene caricato il valore di 4! in F9
	DIVF F10, F2, F9          ; viene calcolato 1/4! e il risultato viene salvato in F10
	ADDF F11, F8, F10         ; nepero = nepero + 1/4!, il risultato viene salvato in F11

	LF F12, fattoriale+0xc    ; viene caricato il valore di 5! in F12
	DIVF F13, F2, F12         ; viene calcolato 1/5! e il risultato viene salvato in F13
	ADDF F14, F13, F11        ; nepero = nepero + 1/5!, il risultato viene salvato in F14

	LF F15, fattoriale+0x10   ; viene caricato il valore di 6! in F15
	DIVF F16, F2, F15         ; viene calcolato 1/6! e il risultato viene salvato in F16
	ADDF F17, F16, F14        ; nepero = nepero + 1/6!, il risultato viene salvato in F17

	LF F18, fattoriale+0x14   ; viene caricato il valore di 7! in F18
	DIVF F19, F2, F18	  ; viene calcolato 1/7! e il risultato viene salvato in F19
	ADDF F20, F17, F19        ; nepero = nepero + 1/7!, il risulato viene salvato in F20

	LF F21, fattoriale+0x18   ; viene caricato il valore di 8! in F21
	DIVF F22, F2, F21         ; viene calcolato 1/8! e il risultato viene salvato in F22
	ADDF F23, F22, F20        ; nepero = nepero + 1/8!, il risultato FINALE viene salvato in F23

	trap 0			  ; istruzione di fine esecuzione
	
	
