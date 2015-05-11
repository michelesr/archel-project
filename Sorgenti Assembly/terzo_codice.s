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

	LF F2, dividendo          ; caricamento del dividendo in F2

	LF F3, fattoriale         ; caricamento di 2! in F3
	DIVF F4, F2, F3	          ; divisione 1/2!, risultato in F4
	LF F1, valore		  ; caricamento del valore iniziale di e in F1
	LF F6, fattoriale+0x4     ; caricamento di 3! in F6
	ADDF F5, F4, F1           ; nepero = nepero + 1/2!, risultato in F5

	DIVF F7, F2, F6           ; divisione 1/3!, risultato in F7
	LF F9, fattoriale+0x8     ; caricamento di 4! in F9
	ADDF F8, F7, F5           ; nepero = nepero + 1/3!, risultato in F8

	DIVF F10, F2, F9          ; divisione 1/4!, risultato in F10
	LF F12, fattoriale+0xc    ; caricamento di 5! in F12
	ADDF F11, F8, F10         ; nepero = nepero + 1/4!, risultato in F11

	DIVF F13, F2, F12         ; divisione 1/5!, risultato in F13
	LF F15, fattoriale+0x10   ; caricamento di 6! in F15
	ADDF F14, F13, F11        ; nepero = nepero + 1/5!, risultato in F14

	DIVF F16, F2, F15         ; divisione 1/6!, risultato in F16
	LF F18, fattoriale+0x14   ; caricamento di 7! in F18
	ADDF F17, F16, F14        ; nepero = nepero + 1/6!, risultato in F17
 
	DIVF F19, F2, F18         ; divisione 1/7!, risultato in F19
	LF F21, fattoriale+0x18   ; caricamento di 8! in F21
	ADDF F20, F17, F19        ; nepero = nepero + 1/7!, risultato in F20

	DIVF F22, F2, F21         ; divisione 1/8!, risultato in F22
	ADDF F23, F22, F20        ; nepero = nepero + 1/8!, risultato FINALE in F23

	trap 0			  ; istruzione di fine esecuzione
	
	
