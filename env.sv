class freq_env extends uvm_env;
  `uvm_component_utils(freq_env)

  freq_agent agt;
  freq_env_config m_cfg;
  freq_scoreboard sb; // <--- Added scoreboard

  function new(string name="freq_env", uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);

    if(!uvm_config_db #(freq_env_config)::get(this, "", "freq_env_config", m_cfg))
      `uvm_fatal("GET_freq_env_CFG", "Failed to get freq_env_config")

    agt = freq_agent::type_id::create("agt", this);
    sb      = freq_scoreboard::type_id::create("sb", this); // <--- Create scoreboard
	uvm_config_db#(freq_agent_config)::set(this, "*", "freq_agent_config", m_cfg.agt_cfg);
  endfunction

  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);

    // Connect monitor's analysis port to scoreboard
    agt.mon.ap.connect(sb.sb_export);
  endfunction

endclass
