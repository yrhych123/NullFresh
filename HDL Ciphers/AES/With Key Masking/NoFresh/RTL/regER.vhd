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

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY regER IS
	GENERIC ( size: POSITIVE);
	PORT ( clk 	: IN  STD_LOGIC;
			 rst	: IN  STD_LOGIC;
			 EN   : IN  STD_LOGIC;
			 D 	: IN  STD_LOGIC_VECTOR ((size-1) DOWNTO 0);
			 Q 	: OUT  STD_LOGIC_VECTOR ((size-1) DOWNTO 0) := (others => '0'));
END regER;

ARCHITECTURE behavioral OF regER IS
BEGIN

	reg_gen: PROCESS(clk, D)
	BEGIN
		IF RISING_EDGE(clk) THEN
			IF (rst = '1') THEN
				Q	<= (others => '0');
			ELSIF (EN = '1') THEN
				Q	<= D;
			END IF;
		END IF;
	END PROCESS;		
	
END;

