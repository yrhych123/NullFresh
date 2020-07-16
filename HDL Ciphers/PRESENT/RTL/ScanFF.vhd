--
-----------------------------------------------------------------
-- COMPANY : Ruhr University Bochum
-- AUTHOR  : Amir Moradi (amir.moradi@rub.de) Aein Rezaei Shahmirzadi (aein.rezaeishahmirzadi@rub.de)
-- DOCUMENT: https://eprint.iacr.org/2020/890.pdf
-- -----------------------------------------------------------------
--
-- Copyright (c) 2020, Amir Moradi, Aein Rezaei Shahmirzadi
--
-- All rights reserved.
--
-- THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
-- ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
-- WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
-- DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTERS BE LIABLE FOR ANY
-- DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
-- (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
-- LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
-- ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
-- (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
-- SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
--
-- Please see LICENSE and README for license and further instructions.
--

-- IMPORTS
----------------------------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;



-- ENTITY
----------------------------------------------------------------------------------
ENTITY ScanFF IS
	GENERIC (SIZE : INTEGER := 8);
	PORT ( CLK	: IN 	STD_LOGIC;
			 SE 	: IN 	STD_LOGIC;
          D  	: IN 	STD_LOGIC_VECTOR((SIZE - 1) DOWNTO 0);
          DS	: IN 	STD_LOGIC_VECTOR((SIZE - 1) DOWNTO 0);
          Q 	: OUT STD_LOGIC_VECTOR((SIZE - 1) DOWNTO 0));
END ScanFF;



-- ARCHITECTURE
----------------------------------------------------------------------------------
ARCHITECTURE Structural OF ScanFF IS	

	-- COMPONENTS -----------------------------------------------------------------
	COMPONENT dflipfloplw IS
	PORT ( CLK     : IN  STD_LOGIC;
			 SEL	   : IN  STD_LOGIC;
			 D0      : IN  STD_LOGIC;
			 D1    	: IN  STD_LOGIC;
			 Q       : OUT STD_LOGIC);
	END COMPONENT ;	
	-------------------------------------------------------------------------------

-- STRUCTURAL
----------------------------------------------------------------------------------
BEGIN
	
	-------------------------------------------------------------------------------
	GEN : FOR I IN 0 TO (SIZE - 1) GENERATE	
		SFF : dflipfloplw
		PORT MAP (
			CLK	=> CLK,
			SEL	=> SE,
			D0		=> D(I),
			D1		=> DS(I),
			Q		=> Q(I));
	END GENERATE;
	-------------------------------------------------------------------------------

END Structural;


