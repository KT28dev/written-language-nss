#include "x0_i0_stringlib"

string ReverseString(string sString)
{
  string sReversedString = "";
  int nStringLength = GetStringLength(sString);
  int i;

  for (i = nStringLength; i >= 0; i--)
  {
    sReversedString = sReversedString + GetSubString(sString, i, 1);
  }

  return sReversedString;
}

int StartsWithCapital(string sString)
{
  string sCapitals = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
  string sFirstLetter = GetSubString(sString, 0, 1);

  return FindSubString(sCapitals, sFirstLetter) > -1;
}

string CapitalizeLastLetter(string sWord)
{
  int nWordLength = GetStringLength(sWord);

  string sHead = GetStringLeft(sWord, nWordLength - 1);
  string sTail = GetStringRight(sWord, 1);

  return sHead + GetStringUpperCase(sTail);
}

string LowercaseFirstLetter(string sWord)
{
  string sFirstLetter = GetSubString(sWord, 0, 1);
  string sTail = GetStringRight(sWord, GetStringLength(sWord) - 1);

  return GetStringLowerCase(sFirstLetter) + sTail;
}

string JumbleWord(string sWord)
{
  string sTail = "";
  string sHead = sWord;
  int nWordLength = GetStringLength(sWord);

  if (GetSubString(sWord, nWordLength - 1, 1) == "." || GetSubString(sWord, nWordLength - 1, 1) == ",")
  {
    sHead = GetStringLeft(sWord, nWordLength - 1);
    sTail = GetStringRight(sWord, 1);
  }

  if (StartsWithCapital(sWord))
  {
    sHead = LowercaseFirstLetter(CapitalizeLastLetter(sHead));
    ActionSpeakString(sHead);
  }

  return "<c¦Iÿ>" + ReverseString(sHead) + sTail + "</c>";
}

void main()
{
  string sText = "Moradin, the Dwarffather, is the dwarven lawful good chief deity. He represents the dwarven strength and force of will. He inspires dwarven inventions, seeks to improve the dwarven and encourage their good nature, intelligence, and harmonious existence with other good races while battling their pride and isolationist tendencies.";
  int nFluency = 50;
  int nTokens = GetNumberTokens(sText, " ");
  int i;
  string sTranslatedText = "";

  for (i = 0; i < nTokens; i++)
  {
    string sWord = GetTokenByPosition(sText, " ", i);
    int nRandom = Random(100);

    if (nRandom < nFluency)
    {
      sTranslatedText = sTranslatedText + " " + sWord;
    }
    else
    {
      sTranslatedText = sTranslatedText + " " + JumbleWord(sWord);
    }
  }

  ActionSpeakString(sTranslatedText);
}
