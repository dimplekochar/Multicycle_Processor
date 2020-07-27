-- Copyright (C) 1991-2016 Altera Corporation. All rights reserved.
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, the Altera Quartus Prime License Agreement,
-- the Altera MegaCore Function License Agreement, or other 
-- applicable license agreement, including, without limitation, 
-- that your use is for the sole purpose of programming logic 
-- devices manufactured by Altera and sold by Altera or its 
-- authorized distributors.  Please refer to the applicable 
-- agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 16.0.0 Build 211 04/27/2016 SJ Lite Edition"

-- DATE "11/03/2018 00:31:09"

-- 
-- Device: Altera EP4CE22F17C6 Package FBGA256
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	demux2 IS
    PORT (
	din : IN std_logic_vector(8 DOWNTO 0);
	sel : IN std_logic;
	dout1 : OUT std_logic_vector(8 DOWNTO 0);
	dout2 : OUT std_logic_vector(8 DOWNTO 0)
	);
END demux2;

-- Design Ports Information
-- dout1[0]	=>  Location: PIN_N12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dout1[1]	=>  Location: PIN_N11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dout1[2]	=>  Location: PIN_T12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dout1[3]	=>  Location: PIN_T15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dout1[4]	=>  Location: PIN_P14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dout1[5]	=>  Location: PIN_N14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dout1[6]	=>  Location: PIN_N16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dout1[7]	=>  Location: PIN_P11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dout1[8]	=>  Location: PIN_F14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dout2[0]	=>  Location: PIN_T14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dout2[1]	=>  Location: PIN_R11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dout2[2]	=>  Location: PIN_M10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dout2[3]	=>  Location: PIN_R12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dout2[4]	=>  Location: PIN_N9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dout2[5]	=>  Location: PIN_P9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dout2[6]	=>  Location: PIN_P16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dout2[7]	=>  Location: PIN_R16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dout2[8]	=>  Location: PIN_D16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- din[0]	=>  Location: PIN_E16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sel	=>  Location: PIN_E15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- din[1]	=>  Location: PIN_T13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- din[2]	=>  Location: PIN_P15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- din[3]	=>  Location: PIN_T11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- din[4]	=>  Location: PIN_R13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- din[5]	=>  Location: PIN_R14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- din[6]	=>  Location: PIN_R10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- din[7]	=>  Location: PIN_T10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- din[8]	=>  Location: PIN_D15,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF demux2 IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_din : std_logic_vector(8 DOWNTO 0);
SIGNAL ww_sel : std_logic;
SIGNAL ww_dout1 : std_logic_vector(8 DOWNTO 0);
SIGNAL ww_dout2 : std_logic_vector(8 DOWNTO 0);
SIGNAL \dout1[0]~output_o\ : std_logic;
SIGNAL \dout1[1]~output_o\ : std_logic;
SIGNAL \dout1[2]~output_o\ : std_logic;
SIGNAL \dout1[3]~output_o\ : std_logic;
SIGNAL \dout1[4]~output_o\ : std_logic;
SIGNAL \dout1[5]~output_o\ : std_logic;
SIGNAL \dout1[6]~output_o\ : std_logic;
SIGNAL \dout1[7]~output_o\ : std_logic;
SIGNAL \dout1[8]~output_o\ : std_logic;
SIGNAL \dout2[0]~output_o\ : std_logic;
SIGNAL \dout2[1]~output_o\ : std_logic;
SIGNAL \dout2[2]~output_o\ : std_logic;
SIGNAL \dout2[3]~output_o\ : std_logic;
SIGNAL \dout2[4]~output_o\ : std_logic;
SIGNAL \dout2[5]~output_o\ : std_logic;
SIGNAL \dout2[6]~output_o\ : std_logic;
SIGNAL \dout2[7]~output_o\ : std_logic;
SIGNAL \dout2[8]~output_o\ : std_logic;
SIGNAL \din[0]~input_o\ : std_logic;
SIGNAL \sel~input_o\ : std_logic;
SIGNAL \dout1[0]~0_combout\ : std_logic;
SIGNAL \din[1]~input_o\ : std_logic;
SIGNAL \dout1[1]~1_combout\ : std_logic;
SIGNAL \din[2]~input_o\ : std_logic;
SIGNAL \dout1[2]~2_combout\ : std_logic;
SIGNAL \din[3]~input_o\ : std_logic;
SIGNAL \dout1[3]~3_combout\ : std_logic;
SIGNAL \din[4]~input_o\ : std_logic;
SIGNAL \dout1[4]~4_combout\ : std_logic;
SIGNAL \din[5]~input_o\ : std_logic;
SIGNAL \dout1[5]~5_combout\ : std_logic;
SIGNAL \din[6]~input_o\ : std_logic;
SIGNAL \dout1[6]~6_combout\ : std_logic;
SIGNAL \din[7]~input_o\ : std_logic;
SIGNAL \dout1[7]~7_combout\ : std_logic;
SIGNAL \din[8]~input_o\ : std_logic;
SIGNAL \dout1[8]~8_combout\ : std_logic;
SIGNAL \dout2[0]$latch~combout\ : std_logic;
SIGNAL \dout2[1]$latch~combout\ : std_logic;
SIGNAL \dout2[2]$latch~combout\ : std_logic;
SIGNAL \dout2[3]$latch~combout\ : std_logic;
SIGNAL \dout2[4]$latch~combout\ : std_logic;
SIGNAL \dout2[5]$latch~combout\ : std_logic;
SIGNAL \dout2[6]$latch~combout\ : std_logic;
SIGNAL \dout2[7]$latch~combout\ : std_logic;
SIGNAL \dout2[8]$latch~combout\ : std_logic;

BEGIN

ww_din <= din;
ww_sel <= sel;
dout1 <= ww_dout1;
dout2 <= ww_dout2;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

-- Location: IOOBUF_X47_Y0_N23
\dout1[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dout1[0]~0_combout\,
	devoe => ww_devoe,
	o => \dout1[0]~output_o\);

-- Location: IOOBUF_X43_Y0_N16
\dout1[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dout1[1]~1_combout\,
	devoe => ww_devoe,
	o => \dout1[1]~output_o\);

-- Location: IOOBUF_X36_Y0_N9
\dout1[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dout1[2]~2_combout\,
	devoe => ww_devoe,
	o => \dout1[2]~output_o\);

-- Location: IOOBUF_X45_Y0_N16
\dout1[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dout1[3]~3_combout\,
	devoe => ww_devoe,
	o => \dout1[3]~output_o\);

-- Location: IOOBUF_X49_Y0_N9
\dout1[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dout1[4]~4_combout\,
	devoe => ww_devoe,
	o => \dout1[4]~output_o\);

-- Location: IOOBUF_X53_Y6_N23
\dout1[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dout1[5]~5_combout\,
	devoe => ww_devoe,
	o => \dout1[5]~output_o\);

-- Location: IOOBUF_X53_Y9_N23
\dout1[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dout1[6]~6_combout\,
	devoe => ww_devoe,
	o => \dout1[6]~output_o\);

-- Location: IOOBUF_X38_Y0_N2
\dout1[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dout1[7]~7_combout\,
	devoe => ww_devoe,
	o => \dout1[7]~output_o\);

-- Location: IOOBUF_X53_Y24_N23
\dout1[8]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dout1[8]~8_combout\,
	devoe => ww_devoe,
	o => \dout1[8]~output_o\);

-- Location: IOOBUF_X45_Y0_N23
\dout2[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dout2[0]$latch~combout\,
	devoe => ww_devoe,
	o => \dout2[0]~output_o\);

-- Location: IOOBUF_X34_Y0_N2
\dout2[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dout2[1]$latch~combout\,
	devoe => ww_devoe,
	o => \dout2[1]~output_o\);

-- Location: IOOBUF_X43_Y0_N23
\dout2[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dout2[2]$latch~combout\,
	devoe => ww_devoe,
	o => \dout2[2]~output_o\);

-- Location: IOOBUF_X36_Y0_N16
\dout2[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dout2[3]$latch~combout\,
	devoe => ww_devoe,
	o => \dout2[3]~output_o\);

-- Location: IOOBUF_X29_Y0_N2
\dout2[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dout2[4]$latch~combout\,
	devoe => ww_devoe,
	o => \dout2[4]~output_o\);

-- Location: IOOBUF_X38_Y0_N9
\dout2[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dout2[5]$latch~combout\,
	devoe => ww_devoe,
	o => \dout2[5]~output_o\);

-- Location: IOOBUF_X53_Y7_N9
\dout2[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dout2[6]$latch~combout\,
	devoe => ww_devoe,
	o => \dout2[6]~output_o\);

-- Location: IOOBUF_X53_Y8_N23
\dout2[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dout2[7]$latch~combout\,
	devoe => ww_devoe,
	o => \dout2[7]~output_o\);

-- Location: IOOBUF_X53_Y25_N2
\dout2[8]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dout2[8]$latch~combout\,
	devoe => ww_devoe,
	o => \dout2[8]~output_o\);

-- Location: IOIBUF_X53_Y17_N8
\din[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_din(0),
	o => \din[0]~input_o\);

-- Location: IOIBUF_X53_Y17_N1
\sel~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_sel,
	o => \sel~input_o\);

-- Location: LCCOMB_X44_Y4_N0
\dout1[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \dout1[0]~0_combout\ = (\din[0]~input_o\ & !\sel~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \din[0]~input_o\,
	datad => \sel~input_o\,
	combout => \dout1[0]~0_combout\);

-- Location: IOIBUF_X40_Y0_N15
\din[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_din(1),
	o => \din[1]~input_o\);

-- Location: LCCOMB_X44_Y4_N18
\dout1[1]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \dout1[1]~1_combout\ = (\din[1]~input_o\ & !\sel~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \din[1]~input_o\,
	datad => \sel~input_o\,
	combout => \dout1[1]~1_combout\);

-- Location: IOIBUF_X53_Y6_N15
\din[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_din(2),
	o => \din[2]~input_o\);

-- Location: LCCOMB_X44_Y4_N28
\dout1[2]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \dout1[2]~2_combout\ = (\din[2]~input_o\ & !\sel~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \din[2]~input_o\,
	datad => \sel~input_o\,
	combout => \dout1[2]~2_combout\);

-- Location: IOIBUF_X36_Y0_N22
\din[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_din(3),
	o => \din[3]~input_o\);

-- Location: LCCOMB_X44_Y4_N30
\dout1[3]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \dout1[3]~3_combout\ = (\din[3]~input_o\ & !\sel~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \din[3]~input_o\,
	datad => \sel~input_o\,
	combout => \dout1[3]~3_combout\);

-- Location: IOIBUF_X40_Y0_N22
\din[4]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_din(4),
	o => \din[4]~input_o\);

-- Location: LCCOMB_X44_Y4_N16
\dout1[4]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \dout1[4]~4_combout\ = (\din[4]~input_o\ & !\sel~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \din[4]~input_o\,
	datad => \sel~input_o\,
	combout => \dout1[4]~4_combout\);

-- Location: IOIBUF_X49_Y0_N1
\din[5]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_din(5),
	o => \din[5]~input_o\);

-- Location: LCCOMB_X44_Y4_N2
\dout1[5]~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \dout1[5]~5_combout\ = (\din[5]~input_o\ & !\sel~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \din[5]~input_o\,
	datad => \sel~input_o\,
	combout => \dout1[5]~5_combout\);

-- Location: IOIBUF_X34_Y0_N22
\din[6]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_din(6),
	o => \din[6]~input_o\);

-- Location: LCCOMB_X44_Y4_N4
\dout1[6]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \dout1[6]~6_combout\ = (\din[6]~input_o\ & !\sel~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \din[6]~input_o\,
	datad => \sel~input_o\,
	combout => \dout1[6]~6_combout\);

-- Location: IOIBUF_X34_Y0_N15
\din[7]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_din(7),
	o => \din[7]~input_o\);

-- Location: LCCOMB_X44_Y4_N14
\dout1[7]~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \dout1[7]~7_combout\ = (\din[7]~input_o\ & !\sel~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \din[7]~input_o\,
	datad => \sel~input_o\,
	combout => \dout1[7]~7_combout\);

-- Location: IOIBUF_X53_Y26_N22
\din[8]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_din(8),
	o => \din[8]~input_o\);

-- Location: LCCOMB_X52_Y25_N8
\dout1[8]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \dout1[8]~8_combout\ = (!\sel~input_o\ & \din[8]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \sel~input_o\,
	datad => \din[8]~input_o\,
	combout => \dout1[8]~8_combout\);

-- Location: LCCOMB_X44_Y4_N24
\dout2[0]$latch\ : cycloneive_lcell_comb
-- Equation(s):
-- \dout2[0]$latch~combout\ = (\din[0]~input_o\ & \sel~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \din[0]~input_o\,
	datad => \sel~input_o\,
	combout => \dout2[0]$latch~combout\);

-- Location: LCCOMB_X44_Y4_N26
\dout2[1]$latch\ : cycloneive_lcell_comb
-- Equation(s):
-- \dout2[1]$latch~combout\ = (\din[1]~input_o\ & \sel~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \din[1]~input_o\,
	datad => \sel~input_o\,
	combout => \dout2[1]$latch~combout\);

-- Location: LCCOMB_X44_Y4_N12
\dout2[2]$latch\ : cycloneive_lcell_comb
-- Equation(s):
-- \dout2[2]$latch~combout\ = (\din[2]~input_o\ & \sel~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \din[2]~input_o\,
	datad => \sel~input_o\,
	combout => \dout2[2]$latch~combout\);

-- Location: LCCOMB_X44_Y4_N22
\dout2[3]$latch\ : cycloneive_lcell_comb
-- Equation(s):
-- \dout2[3]$latch~combout\ = (\din[3]~input_o\ & \sel~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \din[3]~input_o\,
	datad => \sel~input_o\,
	combout => \dout2[3]$latch~combout\);

-- Location: LCCOMB_X44_Y4_N8
\dout2[4]$latch\ : cycloneive_lcell_comb
-- Equation(s):
-- \dout2[4]$latch~combout\ = (\din[4]~input_o\ & \sel~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \din[4]~input_o\,
	datad => \sel~input_o\,
	combout => \dout2[4]$latch~combout\);

-- Location: LCCOMB_X44_Y4_N10
\dout2[5]$latch\ : cycloneive_lcell_comb
-- Equation(s):
-- \dout2[5]$latch~combout\ = (\din[5]~input_o\ & \sel~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \din[5]~input_o\,
	datad => \sel~input_o\,
	combout => \dout2[5]$latch~combout\);

-- Location: LCCOMB_X44_Y4_N20
\dout2[6]$latch\ : cycloneive_lcell_comb
-- Equation(s):
-- \dout2[6]$latch~combout\ = (\din[6]~input_o\ & \sel~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \din[6]~input_o\,
	datad => \sel~input_o\,
	combout => \dout2[6]$latch~combout\);

-- Location: LCCOMB_X44_Y4_N6
\dout2[7]$latch\ : cycloneive_lcell_comb
-- Equation(s):
-- \dout2[7]$latch~combout\ = (\din[7]~input_o\ & \sel~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \din[7]~input_o\,
	datad => \sel~input_o\,
	combout => \dout2[7]$latch~combout\);

-- Location: LCCOMB_X52_Y25_N18
\dout2[8]$latch\ : cycloneive_lcell_comb
-- Equation(s):
-- \dout2[8]$latch~combout\ = (\sel~input_o\ & \din[8]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \sel~input_o\,
	datad => \din[8]~input_o\,
	combout => \dout2[8]$latch~combout\);

ww_dout1(0) <= \dout1[0]~output_o\;

ww_dout1(1) <= \dout1[1]~output_o\;

ww_dout1(2) <= \dout1[2]~output_o\;

ww_dout1(3) <= \dout1[3]~output_o\;

ww_dout1(4) <= \dout1[4]~output_o\;

ww_dout1(5) <= \dout1[5]~output_o\;

ww_dout1(6) <= \dout1[6]~output_o\;

ww_dout1(7) <= \dout1[7]~output_o\;

ww_dout1(8) <= \dout1[8]~output_o\;

ww_dout2(0) <= \dout2[0]~output_o\;

ww_dout2(1) <= \dout2[1]~output_o\;

ww_dout2(2) <= \dout2[2]~output_o\;

ww_dout2(3) <= \dout2[3]~output_o\;

ww_dout2(4) <= \dout2[4]~output_o\;

ww_dout2(5) <= \dout2[5]~output_o\;

ww_dout2(6) <= \dout2[6]~output_o\;

ww_dout2(7) <= \dout2[7]~output_o\;

ww_dout2(8) <= \dout2[8]~output_o\;
END structure;


