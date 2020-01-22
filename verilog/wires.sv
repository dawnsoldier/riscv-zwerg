package wires;

  typedef struct packed{
    logic [0 : 0] alu_add;
    logic [0 : 0] alu_sub;
    logic [0 : 0] alu_sll;
    logic [0 : 0] alu_srl;
    logic [0 : 0] alu_sra;
    logic [0 : 0] alu_slt;
    logic [0 : 0] alu_sltu;
    logic [0 : 0] alu_and;
    logic [0 : 0] alu_or;
    logic [0 : 0] alu_xor;
  } alu_op_type;

  alu_op_type init_alu_op = '{
    alu_add : 0,
    alu_sub : 0,
    alu_sll : 0,
    alu_srl : 0,
    alu_sra : 0,
    alu_slt : 0,
    alu_sltu : 0,
    alu_and : 0,
    alu_or : 0,
    alu_xor : 0
  };

  typedef struct packed{
    logic [0 : 0] lsu_lb;
    logic [0 : 0] lsu_lbu;
    logic [0 : 0] lsu_lh;
    logic [0 : 0] lsu_lhu;
    logic [0 : 0] lsu_lw;
    logic [0 : 0] lsu_sb;
    logic [0 : 0] lsu_sh;
    logic [0 : 0] lsu_sw;
  } lsu_op_type;

  lsu_op_type init_lsu_op = '{
    lsu_lb : 0,
    lsu_lbu : 0,
    lsu_lh : 0,
    lsu_lhu : 0,
    lsu_lw : 0,
    lsu_sb : 0,
    lsu_sh : 0,
    lsu_sw : 0
  };

  typedef struct packed{
    logic [0 : 0] bcu_beq;
    logic [0 : 0] bcu_bne;
    logic [0 : 0] bcu_blt;
    logic [0 : 0] bcu_bge;
    logic [0 : 0] bcu_bltu;
    logic [0 : 0] bcu_bgeu;
  } bcu_op_type;

  bcu_op_type init_bcu_op = '{
    bcu_beq : 0,
    bcu_bne : 0,
    bcu_blt : 0,
    bcu_bge : 0,
    bcu_bltu : 0,
    bcu_bgeu : 0
  };

  typedef struct packed{
    logic [31 : 0] rdata1;
    logic [31 : 0] rdata2;
    logic [31 : 0] imm;
    logic [0  : 0] sel;
    alu_op_type alu_op;
  } alu_in_type;

  typedef struct packed{
    logic [31 : 0] res;
  } alu_out_type;

  typedef struct packed{
    logic [31 : 0] rdata1;
    logic [31 : 0] rdata2;
    bcu_op_type bcu_op;
  } bcu_in_type;

  typedef struct packed{
    logic [0 : 0] branch;
  } bcu_out_type;

  typedef struct packed{
    logic [31 : 0] rdata1;
    logic [31 : 0] imm;
    logic [31 : 0] pc;
    logic [0  : 0] auipc;
    logic [0  : 0] jal;
    logic [0  : 0] jalr;
    logic [0  : 0] branch;
    logic [0  : 0] load;
    logic [0  : 0] store;
    lsu_op_type lsu_op;
  } agu_in_type;

  typedef struct packed{
    logic [31 : 0] address;
    logic [3  : 0] byteenable;
    logic [0  : 0] exception;
    logic [3  : 0] ecause;
    logic [31 : 0] etval;
  } agu_out_type;

  typedef struct packed{
    logic [31 : 0] ldata;
    logic [3  : 0] byteenable;
    lsu_op_type lsu_op;
  } lsu_in_type;

  typedef struct packed{
    logic [31 : 0] res;
  } lsu_out_type;

  typedef struct packed{
    logic [31 : 0] instr;
  } decoder_in_type;

  typedef struct packed{
    logic [31 : 0] imm;
    logic [11 : 0] csr_addr;
    logic [1  : 0] csr_mode;
    logic wren;
    logic rden1;
    logic rden2;
    logic csr_wren;
    logic csr_rden;
    logic auipc;
    logic lui;
    logic jal;
    logic jalr;
    logic branch;
    logic load;
    logic store;
    logic csr;
    alu_op_type alu_op;
    bcu_op_type bcu_op;
    lsu_op_type lsu_op;
    logic fence;
    logic ecall;
    logic ebreak;
    logic mret;
    logic wfi;
    logic valid;
  } decoder_out_type;

  typedef struct packed{
    logic [0  : 0] rden1;
    logic [4  : 0] raddr1;
    logic [0  : 0] rden2;
    logic [4  : 0] raddr2;
    logic [0  : 0] wren;
    logic [4  : 0] waddr;
    logic [31 : 0] wdata;
  } register_in_type;

  typedef struct packed{
    logic [31 : 0] rdata1;
    logic [31 : 0] rdata2;
  } register_out_type;

  typedef struct packed{
    logic [31 : 0] pc;
    logic [31 : 0] instr;
    logic [0  : 0] exception;
    logic [3  : 0] ecause;
    logic [31 : 0] etval;
  } fetch_out_type;

  typedef struct packed{
    logic [31 : 0] pc;
    logic [31 : 0] instr;
    logic [0  : 0] valid;
    logic [0  : 0] exception;
    logic [3  : 0] ecause;
    logic [31 : 0] etval;
    logic [0  : 0] stall;
  } fetch_reg_type;

  fetch_reg_type init_fetch_reg = '{
    pc : 0,
    instr : 0,
    valid : 0,
    exception : 0,
    ecause : 0,
    etval : 0,
    stall : 0
  };

  typedef struct packed{
    logic [31 : 0] pc;
    logic [31 : 0] npc;
    logic [31 : 0] imm;
    logic [0  : 0] wren;
    logic [0  : 0] rden1;
    logic [0  : 0] rden2;
    logic [0  : 0] csr_wren;
    logic [0  : 0] csr_rden;
    logic [4  : 0] waddr;
    logic [4  : 0] raddr1;
    logic [4  : 0] raddr2;
    logic [11 : 0] caddr;
    logic [0  : 0] auipc;
    logic [0  : 0] lui;
    logic [0  : 0] jal;
    logic [0  : 0] jalr;
    logic [0  : 0] branch;
    logic [0  : 0] load;
    logic [0  : 0] store;
    logic [0  : 0] csr;
    logic [0  : 0] fence;
    logic [0  : 0] ecall;
    logic [0  : 0] ebreak;
    logic [0  : 0] mret;
    logic [0  : 0] wfi;
    logic [0  : 0] valid;
    logic [0  : 0] jump;
    logic [31 : 0] rdata1;
    logic [31 : 0] rdata2;
    logic [31 : 0] address;
    logic [3  : 0] byteenable;
    alu_op_type alu_op;
    bcu_op_type bcu_op;
    lsu_op_type lsu_op;
    logic [0  : 0] exception;
    logic [3  : 0] ecause;
    logic [31 : 0] etval;
    logic [0  : 0] stall;
  } decode_out_type;

  typedef struct packed{
    logic [31 : 0] pc;
    logic [31 : 0] instr;
    logic [31 : 0] npc;
    logic [31 : 0] imm;
    logic [0  : 0] wren;
    logic [0  : 0] rden1;
    logic [0  : 0] rden2;
    logic [0  : 0] csr_wren;
    logic [0  : 0] csr_rden;
    logic [4  : 0] waddr;
    logic [4  : 0] raddr1;
    logic [4  : 0] raddr2;
    logic [11 : 0] caddr;
    logic [0  : 0] auipc;
    logic [0  : 0] lui;
    logic [0  : 0] jal;
    logic [0  : 0] jalr;
    logic [0  : 0] branch;
    logic [0  : 0] load;
    logic [0  : 0] store;
    logic [0  : 0] csr;
    logic [0  : 0] fence;
    logic [0  : 0] ecall;
    logic [0  : 0] ebreak;
    logic [0  : 0] mret;
    logic [0  : 0] wfi;
    logic [0  : 0] valid;
    logic [0  : 0] jump;
    logic [31 : 0] rdata1;
    logic [31 : 0] rdata2;
    logic [31 : 0] address;
    logic [3  : 0] byteenable;
    alu_op_type alu_op;
    bcu_op_type bcu_op;
    lsu_op_type lsu_op;
    logic [0  : 0] exception;
    logic [3  : 0] ecause;
    logic [31 : 0] etval;
    logic [0  : 0] stall;
    logic [0  : 0] clear;
  } decode_reg_type;

  decode_reg_type init_decode_reg = '{
    pc : 0,
    instr : 0,
    npc : 0,
    imm : 0,
    wren : 0,
    rden1 : 0,
    rden2 : 0,
    csr_wren : 0,
    csr_rden : 0,
    waddr : 0,
    raddr1 : 0,
    raddr2 : 0,
    caddr : 0,
    auipc : 0,
    lui : 0,
    jal : 0,
    jalr : 0,
    branch : 0,
    load : 0,
    store : 0,
    csr : 0,
    fence : 0,
    ecall : 0,
    ebreak : 0,
    mret : 0,
    wfi : 0,
    valid : 0,
    jump : 0,
    rdata1 : 0,
    rdata2 : 0,
    address : 0,
    byteenable : 0,
    alu_op : init_alu_op,
    bcu_op : init_bcu_op,
    lsu_op : init_lsu_op,
    exception : 0,
    ecause : 0,
    etval : 0,
    stall : 0,
    clear : 0
  };

  typedef struct packed{
    logic [31 : 0] pc;
    logic [31 : 0] npc;
    logic [31 : 0] imm;
    logic [0  : 0] wren;
    logic [0  : 0] rden1;
    logic [0  : 0] rden2;
    logic [0  : 0] csr_wren;
    logic [0  : 0] csr_rden;
    logic [4  : 0] waddr;
    logic [4  : 0] raddr1;
    logic [4  : 0] raddr2;
    logic [11 : 0] caddr;
    logic [0  : 0] auipc;
    logic [0  : 0] lui;
    logic [0  : 0] jal;
    logic [0  : 0] jalr;
    logic [0  : 0] branch;
    logic [0  : 0] load;
    logic [0  : 0] store;
    logic [0  : 0] csr;
    logic [0  : 0] fence;
    logic [0  : 0] ecall;
    logic [0  : 0] ebreak;
    logic [0  : 0] mret;
    logic [0  : 0] wfi;
    logic [0  : 0] valid;
    logic [31 : 0] rdata1;
    logic [31 : 0] rdata2;
    logic [31 : 0] wdata;
    logic [31 : 0] ldata;
    logic [31 : 0] sdata;
    logic [31 : 0] address;
    logic [3  : 0] byteenable;
    alu_op_type alu_op;
    bcu_op_type bcu_op;
    lsu_op_type lsu_op;
    logic [0  : 0] exception;
    logic [3  : 0] ecause;
    logic [31 : 0] etval;
    logic [0  : 0] stall;
    logic [0  : 0] clear;
  } execute_out_type;

  typedef struct packed{
    logic [31 : 0] pc;
    logic [31 : 0] npc;
    logic [31 : 0] imm;
    logic [0  : 0] wren;
    logic [0  : 0] rden1;
    logic [0  : 0] rden2;
    logic [0  : 0] csr_wren;
    logic [0  : 0] csr_rden;
    logic [4  : 0] waddr;
    logic [4  : 0] raddr1;
    logic [4  : 0] raddr2;
    logic [11 : 0] caddr;
    logic [0  : 0] auipc;
    logic [0  : 0] lui;
    logic [0  : 0] jal;
    logic [0  : 0] jalr;
    logic [0  : 0] branch;
    logic [0  : 0] load;
    logic [0  : 0] store;
    logic [0  : 0] csr;
    logic [0  : 0] fence;
    logic [0  : 0] ecall;
    logic [0  : 0] ebreak;
    logic [0  : 0] mret;
    logic [0  : 0] wfi;
    logic [0  : 0] valid;
    logic [31 : 0] rdata1;
    logic [31 : 0] rdata2;
    logic [31 : 0] wdata;
    logic [31 : 0] ldata;
    logic [31 : 0] sdata;
    logic [31 : 0] address;
    logic [3  : 0] byteenable;
    alu_op_type alu_op;
    bcu_op_type bcu_op;
    lsu_op_type lsu_op;
    logic [0  : 0] exception;
    logic [3  : 0] ecause;
    logic [31 : 0] etval;
    logic [0  : 0] stall;
    logic [0  : 0] clear;
  } execute_reg_type;

  execute_reg_type init_execute_reg = '{
    pc : 0,
    npc : 0,
    imm : 0,
    wren : 0,
    rden1 : 0,
    rden2 : 0,
    csr_wren : 0,
    csr_rden : 0,
    waddr : 0,
    raddr1 : 0,
    raddr2 : 0,
    caddr : 0,
    auipc : 0,
    lui : 0,
    jal : 0,
    jalr : 0,
    branch : 0,
    load : 0,
    store : 0,
    csr : 0,
    fence : 0,
    ecall : 0,
    ebreak : 0,
    mret : 0,
    wfi : 0,
    valid : 0,
    rdata1 : 0,
    rdata2 : 0,
    wdata : 0,
    ldata : 0,
    sdata : 0,
    address : 0,
    byteenable : 0,
    alu_op : init_alu_op,
    bcu_op : init_bcu_op,
    lsu_op : init_lsu_op,
    exception : 0,
    ecause : 0,
    etval : 0,
    stall : 0,
    clear : 1
  };

  typedef struct packed{
    logic [31 : 0] mstatus;
    logic [31 : 0] misa;
    logic [31 : 0] medeleg;
    logic [31 : 0] mideleg;
    logic [31 : 0] mie;
    logic [31 : 0] mtvec;
    logic [31 : 0] mcounteren;
    logic [31 : 0] mscratch;
    logic [31 : 0] mepc;
    logic [31 : 0] mcause;
    logic [31 : 0] mtval;
    logic [31 : 0] mip;
    logic [63 : 0] mcycle;
    logic [63 : 0] minstret;
  } csr_machine_reg_type;

  csr_machine_reg_type init_csr_machine_reg = '{
    mstatus : 0,
    misa : 0,
    medeleg : 0,
    mideleg : 0,
    mie : 0,
    mtvec : 0,
    mcounteren : 0,
    mscratch : 0,
    mepc : 0,
    mcause : 0,
    mtval : 0,
    mip : 0,
    mcycle : 0,
    minstret : 0
  };

  typedef struct packed{
    logic [0  : 0] valid;
    logic [0  : 0] csr_wren;
    logic [0  : 0] csr_rden;
    logic [11 : 0] csr_waddr;
    logic [11 : 0] csr_raddr;
    logic [31 : 0] csr_wdata;
    logic [0  : 0] mret;
    logic [0  : 0] exception;
    logic [3  : 0] ecause;
    logic [31 : 0] epc;
    logic [31 : 0] etval;
  } csr_in_type;

  typedef struct packed{
    logic [0  : 0] exception;
    logic [0  : 0] mret;
    logic [31 : 0] mtvec;
    logic [31 : 0] mepc;
    logic [31 : 0] csr_rdata;
  } csr_out_type;

  typedef struct packed{
    logic [0  : 0] register_rden1;
    logic [0  : 0] register_rden2;
    logic [4  : 0] register_raddr1;
    logic [4  : 0] register_raddr2;
    logic [31 : 0] register_rdata1;
    logic [31 : 0] register_rdata2;
    logic [0  : 0] execute_wren;
    logic [4  : 0] execute_waddr;
    logic [31 : 0] execute_wdata;
  } forwarding_in_type;

  typedef struct packed{
    logic [31 : 0] data1;
    logic [31 : 0] data2;
  } forwarding_out_type;

  typedef struct packed{
    fetch_out_type f;
    decode_out_type d;
    execute_out_type e;
  } fetch_in_type;

  typedef struct packed{
    fetch_out_type f;
    decode_out_type d;
    execute_out_type e;
  } decode_in_type;

  typedef struct packed{
    fetch_out_type f;
    decode_out_type d;
    execute_out_type e;
  } execute_in_type;

  typedef struct packed{
    logic [0  : 0] mem_valid;
    logic [0  : 0] mem_instr;
    logic [31 : 0] mem_addr;
    logic [31 : 0] mem_wdata;
    logic [3  : 0] mem_wstrb;
  } mem_in_type;

  typedef struct packed{
    logic [0  : 0] mem_ready;
    logic [31 : 0] mem_rdata;
  } mem_out_type;

endpackage