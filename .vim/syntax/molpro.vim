" Vim syntax file
" Language:	MOLPRO input syntax 
" Maintainer:	Antonio G. S. de Oliveira Filho - antoniogsof@gmail.com
" URL:	        https://github.com/antoniogsof/vim-molpro	

if exists("b:current_syntax")
  finish
endif

let b:current_syntax = "molpro"

syntax case ignore

syntax keyword mCommands PROC ENDPROC GEOM GEOMETRY PRIO ELEM TRACE PRID DMO DIAG MULT

syntax keyword mOptions RESTRICT CONFIG ROT TEMP SYM CPHF TYPE PMP DIPOLE START1D SYMM  EXFILE CHECKOVLP INISINGL INIDOUBL LOCE SCALE COEFF NOEXC CPMCSCF GRAD SPIN RECORD SAMC CONICAL NODC STARTCMD FOLLOW CANONICAL ORBITALS CIVECTOR NOEXTRA DIABATIC MIXING TRUNCATE STATES TITLE FORMAT HESSPROC EOM EOMPAR EOMPRINT VARIABLE DIAB MIX ROOT DENSITY DM QM THERMO CONTEXT GRADIENT SHIFT IGNORESHIFT NUMERICAL FOURPOINT NOTRIPL LOAD ADD MOLDEN ANALYTIC ENERGY MOVE DEFAULT ORBITAL NATORB COORD GEOMTYP ACCU RI_BASIS DF_BASIS DF_BASIS_EXCH GEM_BETA SET ECP CORE TRAN EXPEC2 DKROLL SAVEACT SAVEXYZ PROCEDURE ALTERN AOBASIS ATOM BASIS CART CASPROJ CENAO CENMO CIWEIGHTS CLOSED COEFFS CON CRIT DEBUG DELSTRUC DIRPROD DONT FINALTERN FIND FINI FINOPTIM FINREPORT FIXORB FIXSTRUC FREORB FRESTRUC FROZEN FULL GNRM GROUP GUESS HNEW HWRS INIT IRREP IRREPS LQUANT LSYM MAXITER METHOD MOBASIS MOSCOW N NMEP NOCASPROJ NOHW NOINIT NOMA NOPLOC NOPROJCAS NOSCORR NOSVD NOSYMPROJ NOVARPROJ OCC OPPOSITE OPT OPTIM ORB ORBPERM ORBREL ORTH ORTHCON PAIRS PERFLOC PLOC PRBM PRINT PROJCAS QUAS READ REPORT RTHR S SADDLE SAVE SCORR SELECT SERVICE SPECIAL SPINBASIS START STAT STATE STRONG STRUC SVD SYMELM SYMPERM SYMPROJ SYS SYSTEM TIDY TRANS TUNE UORD VARPROJ VBDUMP VBWEIGHTS WEIGHT WF WRITE

syntax keyword mConstants ANG ANGSTROM BOHR DEGREE EV KELVIN KJOULE KCAL CM HZ HERTZ TOEV TOK TOKELVIN TOCM TOHERTZ TOHZ TOKJ TOKJOULE TOKCAL TOA TOANG TODEBYE

syntax match mCCommands "END"

syntax match mConditional	"\<else"
syntax match mConditional	"\<then"
syntax match mConditional	"\<elseif"
syntax match mRepeat	        "\<enddo"
syntax match mConditional	"\<endif"
syntax match mRepeat	        "\<do"
syntax match mConditional	"\<if"

syntax match mOperator	"\.\s*[gl][et]\s*\."
syntax match mOperator	"\.\s*\(eq\|ne\)\s*\."
syntax match mOperator       "\(+\|-\|=\|/\|\*\)"
syntax match mComment        excludenl "[!].*$" contains=@mCommentGroup
syntax region  mComment      matchgroup=mComment       start="\*\*\*"  end="$"  
syntax region  mComment      matchgroup=mComment       start="\-\-\-" end="*"

syntax match mNumber          "\<\d\+[ij]\=\>"
syntax match mNumber         "\<\d\+\(\.\d*\)\=\([edED][-+]\=\d\+\)\=[ij]\=\>"
syntax match mNumber           "\.\d\+\([edED][-+]\=\d\+\)\=[ij]\=\>"
syntax match mDelimiter               "[][(){};]"

syntax cluster mAll        contains=mString,mCommands,mCCommands,mCOptions,mCConstants,mOptions,mConstants,mConditional,mRepeat,mOperator,mComment,mNumber,mDelimiter
syntax region  mBracket    matchgroup=mBrackets     start="\[" end="\]" contains=@mAll,mParensErrB,mParensErrC,mBracket,mParen fold
syntax region  mParen      matchgroup=mParens       start="("  end=")"  contains=@mAll,mParensErrB,mParensErrC,mBracket,mParen fold
syntax region  mBlock      matchgroup=mBraces       start="{"  end="}"  contains=@mAll,mParensErrB,mParensErrC,mBracket,mParen fold

syntax match   mParensError    ")\|}\|\]"
syntax match   mParensErrA     contained "\]"
syntax match   mParensErrB     contained ")"
syntax match   mParensErrC     contained "}"

syntax region   mString    matchgroup=mString      start="\'" end="\'"

syntax match mCCommands "ABINITIO"
syntax match mCCommands "ACPF"
syntax match mCCommands "AM1"
syntax match mCCommands "ANG"
syntax match mCCommands "ANGSTROM"
syntax match mCCommands "AOINT"
syntax match mCCommands "AQCC"
syntax match mCCommands "AVCC"
syntax match mCCommands "AVCCD"
syntax match mCCommands "AVCCSD"
syntax match mCCommands "BASIS"
syntax match mCCommands "BCCD"
syntax match mCCommands "BLASTEST"
syntax match mCCommands "BOHR"
syntax match mCCommands "BVCC"
syntax match mCCommands "BVCCD"
syntax match mCCommands "BVCCSD"
syntax match mCCommands "CACHE"
syntax match mCCommands "CARTESIAN"
syntax match mCCommands "CASSCF"
syntax match mCCommands "CASVB"
syntax match mCCommands "CC2"
syntax match mCCommands "CCSD"
syntax match mCCommands "CEPA"
syntax match mCCommands "CFIT"
syntax match mCCommands "CI"
syntax match mCCommands "CIPT2"
syntax match mCCommands "CIS"
syntax match mCCommands "CISD"
syntax match mCCommands "CLEAR"
syntax match mCCommands "CLEARALL"
syntax match mCCommands "CLOSED"
syntax match mCCommands "COMPRESS"
syntax match mCCommands "CONTINUE"
syntax match mCCommands "CORE"
syntax match mCCommands "COSMO"
syntax match mCCommands "CPF"
syntax match mCCommands "CPFA"
syntax match mCCommands "CPP"
syntax match mCCommands "CPROP"
syntax match mCCommands "CRYSTAL"
syntax match mCCommands "CUBE"
syntax match mCCommands "DALTON"
syntax match mCCommands "DATA"
syntax match mCCommands "DDR"
syntax match mCCommands "DELETE"
syntax match mCCommands "DFIT"
syntax match mCCommands "DFLHF"
syntax match mCCommands "DFT"
syntax match mCCommands "DFUNC"
syntax match mCCommands "DIABCI"
syntax match mCCommands "DIP"
syntax match mCCommands "DIRECT"
syntax match mCCommands "DISPCORR"
syntax match mCCommands "DISPCORR3"
syntax match mCCommands "DMA"
syntax match mCCommands "DMF"
syntax match mCCommands "DP"
syntax match mCCommands "DUMMY"
syntax match mCCommands "ED"
syntax match mCCommands "ERASE"
syntax match mCCommands "EXIT"
syntax match mCCommands "EXPEC"
syntax match mCCommands "EXPLICIT"
syntax match mCCommands "EXPORT"
syntax match mCCommands "EXTRAMO"
syntax match mCCommands "EXTRAPOL"
syntax match mCCommands "EXTRAPOLATE"
syntax match mCCommands "EXX"
syntax match mCCommands "EXXHYB"
syntax match mCCommands "FCI"
syntax match mCCommands "FIELD"
syntax match mCCommands "FILE"
syntax match mCCommands "FORCE"
syntax match mCCommands "FORCES"
syntax match mCCommands "FREQ"
syntax match mCCommands "FREQUENCIES"
syntax match mCCommands "FROZEN"
syntax match mCCommands "FULLCI"
syntax match mCCommands "GATEST"
syntax match mCCommands "GCFIT"
syntax match mCCommands "GCOSMO"
syntax match mCCommands "GDFIT"
syntax match mCCommands "GDIRECT"
syntax match mCCommands "GDM"
syntax match mCCommands "GDMSCF"
syntax match mCCommands "GETVAR"
syntax match mCCommands "GEXPEC"
syntax match mCCommands "GEXPLICIT"
syntax match mCCommands "GLOBAL"
syntax match mCCommands "GLOCAL"
syntax match mCCommands "GOPENMOL"
syntax match mCCommands "GPARAM"
syntax match mCCommands "GPRINT"
syntax match mCCommands "GRID"
syntax match mCCommands "GTHRESH"
syntax match mCCommands "GTHRESHOLD"
syntax match mCCommands "HELP"
syntax match mCCommands "HESS"
syntax match mCCommands "HESSIAN"
syntax match mCCommands "HF"
syntax match mCCommands "IGLO"
syntax match mCCommands "IMPORT"
syntax match mCCommands "INCREMENT"
syntax match mCCommands "INT"
syntax match mCCommands "INTD"
syntax match mCCommands "INTEGRAL"
syntax match mCCommands "INTP"
syntax match mCCommands "INTS"
syntax match mCCommands "IOTEST"
syntax match mCCommands "ITERATIONS"
syntax match mCCommands "KINCORR"
syntax match mCCommands "KS"
syntax match mCCommands "LABEL"
syntax match mCCommands "LATTICE"
syntax match mCCommands "LCC2"
syntax match mCCommands "LCCSD"
syntax match mCCommands "LCISD"
syntax match mCCommands "LHF"
syntax match mCCommands "LIBSPLIT"
syntax match mCCommands "LMP2"
syntax match mCCommands "LMP3"
syntax match mCCommands "LMP4"
syntax match mCCommands "LOCAL"
syntax match mCCommands "LOCALI"
syntax match mCCommands "LOCALIZE"
syntax match mCCommands "LOCHYBRID"
syntax match mCCommands "LOGFILE"
syntax match mCCommands "LOKALI"
syntax match mCCommands "LPF"
syntax match mCCommands "LPFD"
syntax match mCCommands "LPFSD"
syntax match mCCommands "LQCI"
syntax match mCCommands "LQCISD"
syntax match mCCommands "LRMP2"
syntax match mCCommands "LSINT"
syntax match mCCommands "LUCCSD"
syntax match mCCommands "LUCISD"
syntax match mCCommands "LUMP2"
syntax match mCCommands "LUQCI"
syntax match mCCommands "LUQCISD"
syntax match mCCommands "LX"
syntax match mCCommands "MASS"
syntax match mCCommands "MATROP"
syntax match mCCommands "MC"
syntax match mCCommands "MCSCF"
syntax match mCCommands "MEMORY"
syntax match mCCommands "MERGE"
syntax match mCCommands "MIN1D"
syntax match mCCommands "MINIMIZE"
syntax match mCCommands "MNDO"
syntax match mCCommands "MNDOD"
syntax match mCCommands "MP2"
syntax match mCCommands "MP3"
syntax match mCCommands "MP4"
syntax match mCCommands "MPHAM"
syntax match mCCommands "MPP"
syntax match mCCommands "MPPTUNE"
syntax match mCCommands "MRCC"
syntax match mCCommands "MRCI"
syntax match mCCommands "MULTI"
syntax match mCCommands "NBO"
syntax match mCCommands "NEVPT2"
syntax match mCCommands "NMR"
syntax match mCCommands "NMRSHLD"
syntax match mCCommands "NOCOMPRESS"
syntax match mCCommands "NOGPR"
syntax match mCCommands "NOGPRINT"
syntax match mCCommands "NOORIENT"
syntax match mCCommands "NOPR"
syntax match mCCommands "NOPRINT"
syntax match mCCommands "NOSY"
syntax match mCCommands "NOSYM"
syntax match mCCommands "NOSYMMETRY"
syntax match mCCommands "OCC"
syntax match mCCommands "OEP"
syntax match mCCommands "OEPINP"
syntax match mCCommands "OLDCONSTANTS"
syntax match mCCommands "OPENMP"
syntax match mCCommands "OPTG"
syntax match mCCommands "ORBPRI"
syntax match mCCommands "ORIENT"
syntax match mCCommands "PARALLEL"
syntax match mCCommands "PBC"
syntax match mCCommands "PIGLO"
syntax match mCCommands "PLOC"
syntax match mCCommands "PLOT"
syntax match mCCommands "PM3"
syntax match mCCommands "POLY"
syntax match mCCommands "POP"
syntax match mCCommands "PRINT"
syntax match mCCommands "PROP"
syntax match mCCommands "PROPERTI"
syntax match mCCommands "PROPERTY"
syntax match mCCommands "PROPGRID"
syntax match mCCommands "PUNCH"
syntax match mCCommands "PUT"
syntax match mCCommands "QCCA"
syntax match mCCommands "QCI"
syntax match mCCommands "QCISD"
syntax match mCCommands "QMC"
syntax match mCCommands "QUAD"
syntax match mCCommands "QUIT"
syntax match mCCommands "RANDOM"
syntax match mCCommands "RCCSD"
syntax match mCCommands "RCISD"
syntax match mCCommands "RDP"
syntax match mCCommands "READVAR"
syntax match mCCommands "REPEAT"
syntax match mCCommands "RESP"
syntax match mCCommands "RESTART"
syntax match mCCommands "RHF"
syntax match mCCommands "RKS"
syntax match mCCommands "RMP2"
syntax match mCCommands "RQCI"
syntax match mCCommands "RQCISD"
syntax match mCCommands "RS2"
syntax match mCCommands "RS2C"
syntax match mCCommands "RS3"
syntax match mCCommands "SAPT"
syntax match mCCommands "SAVETUNE"
syntax match mCCommands "SELECT"
syntax match mCCommands "SEMI"
syntax match mCCommands "SHOW"
syntax match mCCommands "SLOPT"
syntax match mCCommands "SMP"
syntax match mCCommands "SOLVE"
syntax match mCCommands "SORT"
syntax match mCCommands "SPHERICAL"
syntax match mCCommands "SSINT"
syntax match mCCommands "START"
syntax match mCCommands "STATUS"
syntax match mCCommands "STOP"
syntax match mCCommands "SURF"
syntax match mCCommands "SYMMETRY"
syntax match mCCommands "SYNC"
syntax match mCCommands "SYSTEM"
syntax match mCCommands "TABLE"
syntax match mCCommands "TDDFT_DISP"
syntax match mCCommands "TDDFT_DISP_3BODY"
syntax match mCCommands "TDDFT_RESP"
syntax match mCCommands "TDHF"
syntax match mCCommands "TDKS"
syntax match mCCommands "TDRHF"
syntax match mCCommands "TDUHF"
syntax match mCCommands "TDUKS"
syntax match mCCommands "TEXT"
syntax match mCCommands "THRESH"
syntax match mCCommands "THRESHOLD"
syntax match mCCommands "TUNING"
syntax match mCCommands "UAVCCD"
syntax match mCCommands "UAVCCSD"
syntax match mCCommands "UBVCCD"
syntax match mCCommands "UBVCCSD"
syntax match mCCommands "UCCSD"
syntax match mCCommands "UCISD"
syntax match mCCommands "UDP"
syntax match mCCommands "UEXX"
syntax match mCCommands "UEXXHYB"
syntax match mCCommands "UHF"
syntax match mCCommands "UKS"
syntax match mCCommands "ULPFD"
syntax match mCCommands "ULPFSD"
syntax match mCCommands "UMP2"
syntax match mCCommands "UNSET"
syntax match mCCommands "UQCI"
syntax match mCCommands "UQCISD"
syntax match mCCommands "USER"
syntax match mCCommands "UV"
syntax match mCCommands "VB"
syntax match mCCommands "VCI"
syntax match mCCommands "VLOC"
syntax match mCCommands "VMCSCF"
syntax match mCCommands "VMP2"
syntax match mCCommands "VMRCI"
syntax match mCCommands "VSCF"
syntax match mCCommands "WF"
syntax match mCCommands "RMP2-F12"
syntax match mCCommands "RMP2-F12A"
syntax match mCCommands "RMP2-F12B"
syntax match mCCommands "RMP2-F12C"
syntax match mCCommands "RMP2-F12V"
syntax match mCCommands "RMP2-R12"
syntax match mCCommands "ADC(2)"
syntax match mCCommands "BCCD(T)"
syntax match mCCommands "BCCD-T"
syntax match mCCommands "BCCD\[T\]"
syntax match mCCommands "CCSD(T)"
syntax match mCCommands "CCSD(T)-F12"
syntax match mCCommands "CCSD(T)-F12A"
syntax match mCCommands "CCSD(T)-F12B"
syntax match mCCommands "CCSD(T)-F12C"
syntax match mCCommands "CCSD(T)-F12V"
syntax match mCCommands "CCSD(T)-R12"
syntax match mCCommands "CCSD-F12"
syntax match mCCommands "CCSD-F12A"
syntax match mCCommands "CCSD-F12B"
syntax match mCCommands "CCSD-F12C"
syntax match mCCommands "CCSD-F12V"
syntax match mCCommands "CCSD-R12"
syntax match mCCommands "CCSD-T"
syntax match mCCommands "CCSD\[T\]"
syntax match mCCommands "CF-HF"
syntax match mCCommands "CF-HF-SCF"
syntax match mCCommands "CF-KS"
syntax match mCCommands "CF-KS-SCF"
syntax match mCCommands "CF-RHF"
syntax match mCCommands "CF-RHF-SCF"
syntax match mCCommands "CF-RKS"
syntax match mCCommands "CF-RKS-SCF"
syntax match mCCommands "CF-UHF"
syntax match mCCommands "CF-UHF-SCF"
syntax match mCCommands "CF-UKS"
syntax match mCCommands "CF-UKS-SCF"
syntax match mCCommands "CI-PRO"
syntax match mCCommands "CPFA(T)"
syntax match mCCommands "CPFA-T"
syntax match mCCommands "CPFA\[T\]"
syntax match mCCommands "DF-HF"
syntax match mCCommands "DF-HF-SCF"
syntax match mCCommands "DF-KS"
syntax match mCCommands "DF-KS-SCF"
syntax match mCCommands "DF-LADC(2)"
syntax match mCCommands "DF-LCC2"
syntax match mCCommands "DF-LCC2-B"
syntax match mCCommands "DF-LCCSD"
syntax match mCCommands "DF-LCCSD(ALL)"
syntax match mCCommands "DF-LCCSD(FULL)"
syntax match mCCommands "DF-LCCSD(T)"
syntax match mCCommands "DF-LCCSD(T)-F12"
syntax match mCCommands "DF-LCCSD(T)-F12A"
syntax match mCCommands "DF-LCCSD(T)-F12B"
syntax match mCCommands "DF-LCCSD(T)-F12C"
syntax match mCCommands "DF-LCCSD(T)-F12V"
syntax match mCCommands "DF-LCCSD(T)-R12"
syntax match mCCommands "DF-LCCSD(T0)"
syntax match mCCommands "DF-LCCSD(T1)"
syntax match mCCommands "DF-LCCSD(T1C)"
syntax match mCCommands "DF-LCCSD(TA)"
syntax match mCCommands "DF-LCCSD(TALL)"
syntax match mCCommands "DF-LCCSD(TF)"
syntax match mCCommands "DF-LCCSD(TFULL)"
syntax match mCCommands "DF-LCCSD-F12"
syntax match mCCommands "DF-LCCSD-F12A"
syntax match mCCommands "DF-LCCSD-F12B"
syntax match mCCommands "DF-LCCSD-F12C"
syntax match mCCommands "DF-LCCSD-F12V"
syntax match mCCommands "DF-LCCSD-R12"
syntax match mCCommands "DF-LCISD"
syntax match mCCommands "DF-LMP2"
syntax match mCCommands "DF-LMP2-F12"
syntax match mCCommands "DF-LMP2-F12A"
syntax match mCCommands "DF-LMP2-F12B"
syntax match mCCommands "DF-LMP2-F12C"
syntax match mCCommands "DF-LMP2-F12V"
syntax match mCCommands "DF-LMP2-R12"
syntax match mCCommands "DF-LMP3"
syntax match mCCommands "DF-LMP4"
syntax match mCCommands "DF-LQCI"
syntax match mCCommands "DF-LQCI(ALL)"
syntax match mCCommands "DF-LQCI(FULL)"
syntax match mCCommands "DF-LQCI(T)"
syntax match mCCommands "DF-LQCI(T0)"
syntax match mCCommands "DF-LQCI(T1)"
syntax match mCCommands "DF-LQCI(T1C)"
syntax match mCCommands "DF-LQCI(TA)"
syntax match mCCommands "DF-LQCI(TALL)"
syntax match mCCommands "DF-LQCI(TF)"
syntax match mCCommands "DF-LQCI(TFULL)"
syntax match mCCommands "DF-LQCISD"
syntax match mCCommands "DF-LQCISD(ALL)"
syntax match mCCommands "DF-LQCISD(FULL)"
syntax match mCCommands "DF-LQCISD(T)"
syntax match mCCommands "DF-LQCISD(T0)"
syntax match mCCommands "DF-LQCISD(T1)"
syntax match mCCommands "DF-LQCISD(T1C)"
syntax match mCCommands "DF-LQCISD(TA)"
syntax match mCCommands "DF-LQCISD(TALL)"
syntax match mCCommands "DF-LQCISD(TF)"
syntax match mCCommands "DF-LQCISD(TFULL)"
syntax match mCCommands "DF-LRMP2"
syntax match mCCommands "DF-LT-LADC(2)"
syntax match mCCommands "DF-LT-LCC2"
syntax match mCCommands "DF-LT-LMP2"
syntax match mCCommands "DF-MP2"
syntax match mCCommands "DF-MP2-F12"
syntax match mCCommands "DF-MP2-F12A"
syntax match mCCommands "DF-MP2-F12B"
syntax match mCCommands "DF-MP2-F12C"
syntax match mCCommands "DF-MP2-F12V"
syntax match mCCommands "DF-MP2-R12"
syntax match mCCommands "DF-RHF"
syntax match mCCommands "DF-RHF-SCF"
syntax match mCCommands "DF-RKS"
syntax match mCCommands "DF-RKS-SCF"
syntax match mCCommands "DF-RMP2"
syntax match mCCommands "DF-RMP2-F12"
syntax match mCCommands "DF-RMP2-F12A"
syntax match mCCommands "DF-RMP2-F12B"
syntax match mCCommands "DF-RMP2-F12C"
syntax match mCCommands "DF-RMP2-F12V"
syntax match mCCommands "DF-RMP2-R12"
syntax match mCCommands "DIP+"
syntax match mCCommands "FIELD+"
syntax match mCCommands "HF-SCF"
syntax match mCCommands "KS-SCF"
syntax match mCCommands "LADC(2)"
syntax match mCCommands "LCCSD(ALL)"
syntax match mCCommands "LCCSD(FULL)"
syntax match mCCommands "LCCSD(T)"
syntax match mCCommands "LCCSD(T0)"
syntax match mCCommands "LCCSD(T1)"
syntax match mCCommands "LCCSD(T1C)"
syntax match mCCommands "LCCSD(TA)"
syntax match mCCommands "LCCSD(TALL)"
syntax match mCCommands "LCCSD(TF)"
syntax match mCCommands "LCCSD(TFULL)"
syntax match mCCommands "LCCSDT-1"
syntax match mCCommands "LCCSDT-1A"
syntax match mCCommands "LCCSDT-1B"
syntax match mCCommands "LMP2-F12"
syntax match mCCommands "LMP2-F12A"
syntax match mCCommands "LMP2-F12B"
syntax match mCCommands "LMP2-F12C"
syntax match mCCommands "LMP2-F12V"
syntax match mCCommands "LMP2-R12"
syntax match mCCommands "LQCI(ALL)"
syntax match mCCommands "LQCI(FULL)"
syntax match mCCommands "LQCI(T)"
syntax match mCCommands "LQCI(T0)"
syntax match mCCommands "LQCI(T1)"
syntax match mCCommands "LQCI(T1C)"
syntax match mCCommands "LQCI(TA)"
syntax match mCCommands "LQCI(TALL)"
syntax match mCCommands "LQCI(TF)"
syntax match mCCommands "LQCI(TFULL)"
syntax match mCCommands "LQCISD(ALL)"
syntax match mCCommands "LQCISD(FULL)"
syntax match mCCommands "LQCISD(T)"
syntax match mCCommands "LQCISD(T0)"
syntax match mCCommands "LQCISD(T1)"
syntax match mCCommands "LQCISD(T1C)"
syntax match mCCommands "LQCISD(TA)"
syntax match mCCommands "LQCISD(TALL)"
syntax match mCCommands "LQCISD(TF)"
syntax match mCCommands "LQCISD(TFULL)"
syntax match mCCommands "LQCISDT-1"
syntax match mCCommands "LQCISDT-1A"
syntax match mCCommands "LQCISDT-1B"
syntax match mCCommands "LQCIT-1"
syntax match mCCommands "LQCIT-1A"
syntax match mCCommands "LQCIT-1B"
syntax match mCCommands "LT-DF-LADC(2)"
syntax match mCCommands "LT-DF-LCC2"
syntax match mCCommands "LT-DF-LMP2"
syntax match mCCommands "LT-LADC(2)"
syntax match mCCommands "LT-LCC2"
syntax match mCCommands "LT-LMP2"
syntax match mCCommands "MC-SCF"
syntax match mCCommands "QCCA(T)"
syntax match mCCommands "QCCA-T"
syntax match mCCommands "QCCA\[T\]"
syntax match mCCommands "QCI(T)"
syntax match mCCommands "QCI-T"
syntax match mCCommands "QCISD(T)"
syntax match mCCommands "QCISD-T"
syntax match mCCommands "QCISD\[T\]"
syntax match mCCommands "QCI\[T\]"
syntax match mCCommands "QUAD+"
syntax match mCCommands "RCCSD(T)"
syntax match mCCommands "RCCSD(T)-F12"
syntax match mCCommands "RCCSD(T)-F12A"
syntax match mCCommands "RCCSD(T)-F12B"
syntax match mCCommands "RCCSD(T)-F12C"
syntax match mCCommands "RCCSD(T)-F12V"
syntax match mCCommands "RCCSD(T)-R12"
syntax match mCCommands "RCCSD-F12"
syntax match mCCommands "RCCSD-F12A"
syntax match mCCommands "RCCSD-F12B"
syntax match mCCommands "RCCSD-F12C"
syntax match mCCommands "RCCSD-F12V"
syntax match mCCommands "RCCSD-R12"
syntax match mCCommands "RCCSD-T"
syntax match mCCommands "RCCSD\[T\]"
syntax match mCCommands "RHF-RCCSD"
syntax match mCCommands "RHF-RCCSD(T)"
syntax match mCCommands "RHF-RCCSD(T)-F12"
syntax match mCCommands "RHF-RCCSD(T)-F12A"
syntax match mCCommands "RHF-RCCSD(T)-F12B"
syntax match mCCommands "RHF-RCCSD(T)-F12C"
syntax match mCCommands "RHF-RCCSD(T)-F12V"
syntax match mCCommands "RHF-RCCSD(T)-R12"
syntax match mCCommands "RHF-RCCSD-F12"
syntax match mCCommands "RHF-RCCSD-F12A"
syntax match mCCommands "RHF-RCCSD-F12B"
syntax match mCCommands "RHF-RCCSD-F12C"
syntax match mCCommands "RHF-RCCSD-F12V"
syntax match mCCommands "RHF-RCCSD-R12"
syntax match mCCommands "RHF-RCCSD-T"
syntax match mCCommands "RHF-RCCSD\[T\]"
syntax match mCCommands "RHF-RCISD"
syntax match mCCommands "RHF-RQCI"
syntax match mCCommands "RHF-RQCI(T)"
syntax match mCCommands "RHF-RQCI-T"
syntax match mCCommands "RHF-RQCISD"
syntax match mCCommands "RHF-RQCISD(T)"
syntax match mCCommands "RHF-RQCISD-T"
syntax match mCCommands "RHF-RQCISD\[T\]"
syntax match mCCommands "RHF-RQCI\[T\]"
syntax match mCCommands "RHF-SCF"
syntax match mCCommands "RHF-UAVCCD"
syntax match mCCommands "RHF-UAVCCD(T)"
syntax match mCCommands "RHF-UAVCCD-T"
syntax match mCCommands "RHF-UAVCCD\[T\]"
syntax match mCCommands "RHF-UAVCCSD"
syntax match mCCommands "RHF-UAVCCSD(T)"
syntax match mCCommands "RHF-UAVCCSD-T"
syntax match mCCommands "RHF-UAVCCSD\[T\]"
syntax match mCCommands "RHF-UBVCCD"
syntax match mCCommands "RHF-UBVCCD(T)"
syntax match mCCommands "RHF-UBVCCD-T"
syntax match mCCommands "RHF-UBVCCD\[T\]"
syntax match mCCommands "RHF-UBVCCSD"
syntax match mCCommands "RHF-UBVCCSD(T)"
syntax match mCCommands "RHF-UBVCCSD-T"
syntax match mCCommands "RHF-UBVCCSD\[T\]"
syntax match mCCommands "RHF-UCCSD"
syntax match mCCommands "RHF-UCCSD(T)"
syntax match mCCommands "RHF-UCCSD(T)-F12"
syntax match mCCommands "RHF-UCCSD(T)-F12A"
syntax match mCCommands "RHF-UCCSD(T)-F12B"
syntax match mCCommands "RHF-UCCSD(T)-F12C"
syntax match mCCommands "RHF-UCCSD(T)-F12V"
syntax match mCCommands "RHF-UCCSD(T)-R12"
syntax match mCCommands "RHF-UCCSD-F12"
syntax match mCCommands "RHF-UCCSD-F12A"
syntax match mCCommands "RHF-UCCSD-F12B"
syntax match mCCommands "RHF-UCCSD-F12C"
syntax match mCCommands "RHF-UCCSD-F12V"
syntax match mCCommands "RHF-UCCSD-R12"
syntax match mCCommands "RHF-UCCSD-T"
syntax match mCCommands "RHF-UCCSD\[T\]"
syntax match mCCommands "RHF-UCISD"
syntax match mCCommands "RHF-ULPFD"
syntax match mCCommands "RHF-ULPFD(T)"
syntax match mCCommands "RHF-ULPFD-T"
syntax match mCCommands "RHF-ULPFD\[T\]"
syntax match mCCommands "RHF-ULPFSD"
syntax match mCCommands "RHF-ULPFSD(T)"
syntax match mCCommands "RHF-ULPFSD-T"
syntax match mCCommands "RHF-ULPFSD\[T\]"
syntax match mCCommands "RHF-UQCI"
syntax match mCCommands "RHF-UQCI(T)"
syntax match mCCommands "RHF-UQCI-T"
syntax match mCCommands "RHF-UQCISD"
syntax match mCCommands "RHF-UQCISD(T)"
syntax match mCCommands "RHF-UQCISD-T"
syntax match mCCommands "RHF-UQCISD\[T\]"
syntax match mCCommands "RHF-UQCI\[T\]"
syntax match mCCommands "RKS-SCF"
syntax match mCCommands "RQCI(T)"
syntax match mCCommands "RQCI-T"
syntax match mCCommands "RQCISD(T)"
syntax match mCCommands "RQCISD-T"
syntax match mCCommands "RQCISD\[T\]"
syntax match mCCommands "RQCI\[T\]"
syntax match mCCommands "UAVCCD(T)"
syntax match mCCommands "UAVCCD-T"
syntax match mCCommands "UAVCCD\[T\]"
syntax match mCCommands "UAVCCSD(T)"
syntax match mCCommands "UAVCCSD-T"
syntax match mCCommands "UAVCCSD\[T\]"
syntax match mCCommands "UBVCCD(T)"
syntax match mCCommands "UBVCCD-T"
syntax match mCCommands "UBVCCD\[T\]"
syntax match mCCommands "UBVCCSD(T)"
syntax match mCCommands "UBVCCSD-T"
syntax match mCCommands "UBVCCSD\[T\]"
syntax match mCCommands "UCCSD(T)"
syntax match mCCommands "UCCSD(T)-F12"
syntax match mCCommands "UCCSD(T)-F12A"
syntax match mCCommands "UCCSD(T)-F12B"
syntax match mCCommands "UCCSD(T)-F12C"
syntax match mCCommands "UCCSD(T)-F12V"
syntax match mCCommands "UCCSD(T)-R12"
syntax match mCCommands "UCCSD-F12"
syntax match mCCommands "UCCSD-F12A"
syntax match mCCommands "UCCSD-F12B"
syntax match mCCommands "UCCSD-F12C"
syntax match mCCommands "UCCSD-F12V"
syntax match mCCommands "UCCSD-R12"
syntax match mCCommands "UCCSD-T"
syntax match mCCommands "UCCSD\[T\]"
syntax match mCCommands "UHF-SCF"
syntax match mCCommands "UKS-SCF"
syntax match mCCommands "ULPFD(T)"
syntax match mCCommands "ULPFD-T"
syntax match mCCommands "ULPFD\[T\]"
syntax match mCCommands "ULPFSD(T)"
syntax match mCCommands "ULPFSD-T"
syntax match mCCommands "ULPFSD\[T\]"
syntax match mCCommands "UQCI(T)"
syntax match mCCommands "UQCI-T"
syntax match mCCommands "UQCISD(T)"
syntax match mCCommands "UQCISD-T"
syntax match mCCommands "UQCISD\[T\]"
syntax match mCCommands "UQCI\[T\]"
syntax match mCCommands "MP2-F12"
syntax match mCCommands "MP2-F12A"
syntax match mCCommands "MP2-F12B"
syntax match mCCommands "MP2-F12C"
syntax match mCCommands "MP2-F12V"
syntax match mCCommands "MP2-F12V"

syntax match mCConstants "CM-1"

syntax match mCOptions "EU-U"
syntax match mCOptions "MEP-"
syntax match mCOptions "RS-P"
syntax match mCOptions "TS-B"

syntax region  mText       matchgroup=mText         start="text," end="$"

let b:current_syntax = "molpro"
  hi def link mCommands         Function 
  hi def link mOptions          Type
  hi def link mText             Constant
  hi def link mConstants        Constant
  hi def link mString           Constant
  hi def link mConditional      PreCondit
  hi def link mRepeat           PreCondit
  hi def link mOperator         Operator
  hi def link mComment          Comment
  hi def link mNumber           Number
  hi def link mDelimiter        Identifier
  hi def link mParensError      Error
  hi def link mParensErrA       Error
  hi def link mParensErrB       Error
  hi def link mParensErrC       Error
  hi def link mCOptions         Type
  hi def link mCCommands        Function
  hi def link mCConstants       Constant
