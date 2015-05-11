float calcola_nepero()
{
  float fattoriale[] = {2, 6, 24, 120, 720, 5040, 40320};
  float nepero = 2;
  int i;

  for (i = 0; i < 7; i++)
    nepero = nepero + (1 / fattoriale[i]);

  return(nepero);
}
