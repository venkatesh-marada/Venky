class freq_env_config extends uvm_object;
  `uvm_object_utils(freq_env_config)

  freq_agent_config agt_cfg;
  function new(string name="freq_env_config");
    super.new(name);
  endfunction
endclass
