l i b r a r y i e e e ;
use i e e e . s t d l o g i c 1 1 6 4 . a l l ;
use i e e e . s t d l o g i c a r i t h . a l l ;
use i e e e . s t d l o g i c u n s i g n e d . a l l ;
e n t i t y vhdl04 i s
por t (
sw1 : in s t d l o g i c ;
sw2 : in s t d l o g i c ;
sw3 : in s t d l o g i c ;
sw7 : in s t d l o g i c ;
sw8 : in s t d l o g i c ;
l ed1 : out s t d l o g i c
) ;
end vhdl04 ;
a r c h i t e c t u r e beha v i o r a l o f vhdl04 i s
s i g n a l sw : s t d l o g i c v e c t o r (1 downto 0) ;
begin
sw <= sw8 & sw7 ;
with sw s e l e c t l ed1 <= sw3 when "11" ,
sw2 when "10" ,
sw1 when "01" ,
'0 ' when o the r s ;
end beha v i o r a l ;
