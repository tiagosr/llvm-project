//== M680x0RegisterInfo.td - M680x0 register definitions ----*- tablegen -*-==//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
///
/// \file
/// This file describes the M680x0 Register file, defining the registers
/// aliases between the registers, and the register classes built out of the
/// registers.
///
//===----------------------------------------------------------------------===//

class MxReg<string N, bits<16> ENC,
            list<Register> SUBREGS = [], list<SubRegIndex> SUBIDX,
            list<int> DWREGS = []>
    : Register<N>, DwarfRegNum<DWREGS> {
  let Namespace     = "M680x0";
  let HWEncoding    = ENC;
  let SubRegs       = SUBREGS;
  let SubRegIndices = SUBIDX;
}

// Subregister indices.
let Namespace = "M680x0" in {
  def MxSubRegIndex8Lo  : SubRegIndex<8, 0>;
  def MxSubRegIndex16Lo : SubRegIndex<16, 0>;
}

// Data registers and theirs smaller variants
def "BD0" : MxReg<"d0", 0, [], [], [0]>;
def "BD1" : MxReg<"d1", 1, [], [], [0]>;
def "BD2" : MxReg<"d2", 2, [], [], [0]>;
def "BD3" : MxReg<"d3", 3, [], [], [0]>;
def "BD4" : MxReg<"d4", 4, [], [], [0]>;
def "BD5" : MxReg<"d5", 5, [], [], [0]>;
def "BD6" : MxReg<"d6", 6, [], [], [0]>;
def "BD7" : MxReg<"d7", 7, [], [], [0]>;

def "WD0" : MxReg<"d0", 0, [!cast<Register>("BD0")], [MxSubRegIndex8Lo], [0]>;
def "WD1" : MxReg<"d1", 1, [!cast<Register>("BD1")], [MxSubRegIndex8Lo], [1]>;
def "WD2" : MxReg<"d2", 2, [!cast<Register>("BD2")], [MxSubRegIndex8Lo], [2]>;
def "WD3" : MxReg<"d3", 3, [!cast<Register>("BD3")], [MxSubRegIndex8Lo], [3]>;
def "WD4" : MxReg<"d4", 4, [!cast<Register>("BD4")], [MxSubRegIndex8Lo], [4]>;
def "WD5" : MxReg<"d5", 5, [!cast<Register>("BD5")], [MxSubRegIndex8Lo], [5]>;
def "WD6" : MxReg<"d6", 6, [!cast<Register>("BD6")], [MxSubRegIndex8Lo], [6]>;
def "WD7" : MxReg<"d7", 7, [!cast<Register>("BD7")], [MxSubRegIndex8Lo], [7]>;

def "D0" : MxReg<"d0", 0, [!cast<Register>("WD0")], [MxSubRegIndex16Lo], [0]>;
def "D1" : MxReg<"d1", 1, [!cast<Register>("WD1")], [MxSubRegIndex16Lo], [1]>;
def "D2" : MxReg<"d2", 2, [!cast<Register>("WD2")], [MxSubRegIndex16Lo], [2]>;
def "D3" : MxReg<"d3", 3, [!cast<Register>("WD3")], [MxSubRegIndex16Lo], [3]>;
def "D4" : MxReg<"d4", 4, [!cast<Register>("WD4")], [MxSubRegIndex16Lo], [4]>;
def "D5" : MxReg<"d5", 5, [!cast<Register>("WD5")], [MxSubRegIndex16Lo], [5]>;
def "D6" : MxReg<"d6", 6, [!cast<Register>("WD6")], [MxSubRegIndex16Lo], [6]>;
def "D7" : MxReg<"d7", 7, [!cast<Register>("WD7")], [MxSubRegIndex16Lo], [7]>;

// Address registers and theirs smaller variants
def "WA0" : MxReg<"a0", 0, [], [], [!add(8,0)]>;
def "WA1" : MxReg<"a1", 1, [], [], [!add(8,1)]>;
def "WA2" : MxReg<"a2", 2, [], [], [!add(8,2)]>;
def "WA3" : MxReg<"a3", 3, [], [], [!add(8,3)]>;
def "WA4" : MxReg<"a4", 4, [], [], [!add(8,4)]>;
def "WA5" : MxReg<"a5", 5, [], [], [!add(8,5)]>;
def "WA6" : MxReg<"a6", 6, [], [], [!add(8,6)]>;
def "WA7" : MxReg<"a7", 7, [], [], [!add(8,7)]>;

def "A0" : MxReg<"a0", 0, [!cast<Register>("WA0")], [MxSubRegIndex16Lo], [!add(8,0)]>;
def "A1" : MxReg<"a1", 1, [!cast<Register>("WA1")], [MxSubRegIndex16Lo], [!add(8,1)]>;
def "A2" : MxReg<"a2", 2, [!cast<Register>("WA2")], [MxSubRegIndex16Lo], [!add(8,2)]>;
def "A3" : MxReg<"a3", 3, [!cast<Register>("WA3")], [MxSubRegIndex16Lo], [!add(8,3)]>;
def "A4" : MxReg<"a4", 4, [!cast<Register>("WA4")], [MxSubRegIndex16Lo], [!add(8,4)]>;
def "A5" : MxReg<"a5", 5, [!cast<Register>("WA5")], [MxSubRegIndex16Lo], [!add(8,5)]>;
def "A6" : MxReg<"a6", 6, [!cast<Register>("WA6")], [MxSubRegIndex16Lo], [!add(8,6)]>;
def "A7" : MxReg<"a7", 7, [!cast<Register>("WA7")], [MxSubRegIndex16Lo], [!add(8,7)]>;

// Alias Registers
class MxAliasReg<string N, MxReg REG>
    : MxReg<N, REG.HWEncoding, [], [], REG.DwarfNumbers> {
  let Aliases = [REG];
}

// def BP  : MxAliasReg<"bp",  A5>;
// def FP  : MxAliasReg<"fp",  A6>;
def SP : MxAliasReg<"sp", A7>;

// def USP : MxAliasReg<"usp", A7>;
// def SSP : MxAliasReg<"ssp", A7>;
// def ISP : MxAliasReg<"isp", A7>;

// TODO #50 get rid of "pseudo" registers and use just MxReg variants and use
// HWEncoding's other 13 bits to encode type(and potentially other info) of
// register.

// Pseudo Registers
class MxPseudoReg<string N, list<Register> SUBREGS = [], list<SubRegIndex> SUBIDX = []>
    : MxReg<N, 0, SUBREGS, SUBIDX>;

def CCR : MxPseudoReg<"ccr">;
def SR  : MxPseudoReg<"sr", [], []>;

def PC  : MxPseudoReg<"pc">;

//===----------------------------------------------------------------------===//
// Register Classes
//===----------------------------------------------------------------------===//

class MxRegClass<list<ValueType> regTypes, int alignment, dag regList>
    : RegisterClass<"M680x0", regTypes, alignment, regList>;

// Data Registers
def DR8  : MxRegClass<[i8],  16, (sequence "BD%u", 0, 7)>;
def DR16 : MxRegClass<[i16], 16, (sequence "WD%u", 0, 7)>;
def DR32 : MxRegClass<[i32], 32, (sequence "D%u",  0, 7)>;

// Address Registers
def AR16 : MxRegClass<[i16], 16, (sequence "WA%u", 0, 6)>;
def AR32 : MxRegClass<[i32], 32, (add (sequence "A%u", 0, 6), SP)>;

def AR32_NOSP : MxRegClass<[i32], 32, (add (sequence "A%u", 0, 6))>;

// Index Register Classes
// FIXME #27 try order D0, D1, A0, A1, ...
def XR16 : MxRegClass<[i16], 16, (add DR16, AR16)>;
def XR32 : MxRegClass<[i32], 32, (add DR32, AR32)>;

def SPC  : MxRegClass<[i32], 32, (add SP)>;

let CopyCost = -1 in {
  def CCRC : MxRegClass<[i8],  16, (add CCR)>;
  def SRC  : MxRegClass<[i16], 16, (add SR)>;
}

let isAllocatable = 0 in {
  def PCC  : MxRegClass<[i32], 32, (add PC)>;
}

// Register used with tail call
def DR16_TC : MxRegClass<[i16], 16, (add D0, D1)>;
def DR32_TC : MxRegClass<[i32], 32, (add D0, D1)>;

def AR16_TC : MxRegClass<[i16], 16, (add A0, A1)>;
def AR32_TC : MxRegClass<[i32], 32, (add A0, A1)>;

def XR16_TC : MxRegClass<[i16], 16, (add DR16_TC, AR16_TC)>;
def XR32_TC : MxRegClass<[i32], 32, (add DR32_TC, AR32_TC)>;

// These classes provide spill/restore order if used with MOVEM instruction
def SPILL   : MxRegClass<[i32], 32, (add (add (sequence "D%u", 0, 7), (sequence "A%u", 0, 6)), SP)>;
def SPILL_R : MxRegClass<[i32], 32, (add SP, (add (sequence "A%u", 6, 0), (sequence "D%u", 7, 0)))>;
