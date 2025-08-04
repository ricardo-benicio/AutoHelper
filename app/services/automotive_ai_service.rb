class AutomotiveAiService
  PROBLEMS = {
    # Problemas de partida
    /não liga|não pega|não dá partida|clique|tic/i => {
      diagnosis: "Possível problema na bateria ou motor de partida",
      urgency: 4,
      solution: "Verifique se as luzes do painel acendem. Se não, pode ser bateria descarregada.",
      needs_mechanic: true
    },
    
    # Problemas de aquecimento
    /esquentando|superaquecendo|temperatura alta|vapor/i => {
      diagnosis: "Superaquecimento do motor",
      urgency: 5,
      solution: "PARE O VEÍCULO IMEDIATAMENTE. Verifique nível da água do radiador.",
      needs_mechanic: true
    },
    
    # Problemas de óleo
    /óleo|luz vermelha|pressão/i => {
      diagnosis: "Possível problema com óleo do motor",
      urgency: 4,
      solution: "Verifique nível do óleo com vareta. Se baixo, complete antes de dirigir.",
      needs_mechanic: false
    },
    
    # Problemas de pneu
    /pneu|furou|vazio/i => {
      diagnosis: "Problema no pneu",
      urgency: 3,
      solution: "Verifique calibragem. Se furado, use estepe ou chame guincho.",
      needs_mechanic: false
    },
    
    # Problemas de freio
    /freio|não para|pedal/i => {
      diagnosis: "Problema no sistema de freios",
      urgency: 5,
      solution: "NÃO DIRIJA. Problema de freio é extremamente perigoso.",
      needs_mechanic: true
    }
  }.freeze

  def diagnose(problem_description)
    problem = PROBLEMS.find { |pattern, _| pattern.match?(problem_description) }
    
    if problem
      problem[1]
    else
      {
        diagnosis: "Problema não identificado automaticamente",
        urgency: 3,
        solution: "Descreva mais detalhes ou procure uma oficina para diagnóstico",
        needs_mechanic: true
      }
    end
  end
end

