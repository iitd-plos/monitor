#ifndef PEEP_SNIPPETS_H
#define PEEP_SNIPPETS_H

extern peepgen_label_t peep_snippet_save_guest_flags;
extern peepgen_label_t peep_snippet_restore_guest_flags;
extern peepgen_label_t peep_snippet_exit_tb;
extern peepgen_label_t peep_snippet_increment_vcpu_n_exec;
extern peepgen_label_t peep_snippet_callout_rr_log_vcpu_state;
extern peepgen_label_t peep_snippet_emit_edge1;
extern peepgen_label_t peep_snippet_save_reg;
extern peepgen_label_t peep_snippet_load_reg;
extern peepgen_label_t peep_snippet_jump_indir_insn;
extern peepgen_label_t peep_snippet_ret;
extern peepgen_label_t peep_snippet_romwrite_set_dst;
extern peepgen_label_t peep_snippet_romwrite_set_src;
extern peepgen_label_t peep_snippet_romwrite_set_size;
extern peepgen_label_t peep_snippet_romwrite_transfer;
extern peepgen_label_t peep_snippet_read_mem16;  //%tr0d: eax,%tr1d: no_esp,%vr1d: no_esp
extern peepgen_label_t peep_snippet_mov_mem_to_reg;
extern peepgen_label_t peep_snippet_movb_regaddr_to_al;
extern peepgen_label_t peep_snippet_movb_al_to_regaddr;
extern peepgen_label_t peep_snippet_movw_regaddr_to_ax;
extern peepgen_label_t peep_snippet_movw_ax_to_regaddr;
extern peepgen_label_t peep_snippet_movl_regaddr_to_eax;
extern peepgen_label_t peep_snippet_movl_eax_to_regaddr;
extern peepgen_label_t peep_snippet_movb_dispaddr_to_regaddr;
extern peepgen_label_t peep_snippet_movw_dispaddr_to_regaddr;
extern peepgen_label_t peep_snippet_movl_dispaddr_to_regaddr;
extern peepgen_label_t peep_snippet_check_IF2_and_set;
extern peepgen_label_t peep_snippet_callout_nop_if_pending_irq;
extern peepgen_label_t peep_snippet_jump_to_monitor;
#endif
