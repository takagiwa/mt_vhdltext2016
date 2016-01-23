l i b r a r y i e e e ;
use i e e e . s t d l o g i c 1 1 6 4 . a l l ;
use i e e e . s t d l o g i c a r i t h . a l l ;
use i e e e . s t d l o g i c u n s i g n e d . a l l ;
e n t i t y vhdl03 i s
por t (
sw1 : in s t d l o g i c ;
sw2 : in s t d l o g i c ;
sw8 : in s t d l o g i c ;
l ed1 : out s t d l o g i c
) ;
end vhdl03 ;
a r c h i t e c t u r e beha v i o r a l o f vhdl03 i s
begin
l ed1 <= sw2 when ( sw8 = ' 1 ' )
e l s e sw1 ;
end beha v i o r a l ;
