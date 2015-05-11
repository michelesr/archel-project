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
	LF F1, dividendo         ; caricamento del dividendo in F1 
	LF F9, fattoriale        ; caricamento di 2! in F9

	DIVF F16, F1, F9         ; divisione 1/2!, risultato in F16

	LF F8, valore            ; caricamento del valore iniziale di e in F8
	LF F10, fattoriale+0x4   ; caricamento di 3! in F10
	LF F11, fattoriale+0x8   ; caricamento di 4! in F11
	LF F12, fattoriale+0xc   ; caricamento di 5! in F12
	LF F13, fattoriale+0x10  ; caricamento di 6! in F13
	LF F14, fattoriale+0x14  ; caricamento di 7! in F14
	LF F15, fattoriale+0x18  ; caricamento di 8! in F15

	DIVF F17, F1, F10        ; divisione 1/3!, risultato in F17
	DIVF F18, F1, F11        ; divisione 1/4!, risultato in F18
	DIVF F19, F1, F12        ; divisione 1/5!, risultato in F19
	DIVF F20, F1, F13        ; divisione 1/6!, risultato in F20
	DIVF F21, F1, F14        ; divisione 1/7!, risultato in F21 
	DIVF F22, F1, F15        ; divisione 1/8!, risultato in F22

	ADDF F23, F16, F8        ; nepero = nepero + 1/2!, risultato in F23
	ADDF F24, F18, F19       ; 1/4! + 1/5!, risultato in F24
	ADDF F25, F20, F21       ; 1/6! + 1/7!, risultato in F25
	ADDF F26, F22, F23       ; 1/8! + (2 + 1/2!) = A, ris. in F26
	ADDF F27, F24, F25       ; (1/4! + 1/5!) + (1/6! + 1/7!) = B, ris. in F27
	ADDF F28, F26, F27       ; A + B = C, risultato in F30
	ADDF F30, F28, F17       ; C + 1/3! = e, risultato finale in F30

	trap 0                   ; istruzione di fine esecuzione


