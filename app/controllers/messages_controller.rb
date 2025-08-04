class MessagesController < ApplicationController
  def create
    @conversation = current_user.conversations.find(params[:conversation_id])
    
    # Salva mensagem do usuário
    user_message = @conversation.messages.create!(
      content: params[:content],
      sender_type: 'user',
      ai_response: false
    )
    
    # Gera resposta da IA
    ai_service = AutomotiveAiService.new
    diagnosis = ai_service.diagnose(params[:content])
    
    # Salva resposta da IA
    ai_message = @conversation.messages.create!(
      content: format_ai_response(diagnosis),
      sender_type: 'ai',
      ai_response: true
    )
    
    # Atualiza urgência da conversa
    @conversation.update!(urgency_level: diagnosis[:urgency])
    
    render json: {
      user_message: user_message,
      ai_message: ai_message,
      diagnosis: diagnosis
    }
  end

  private

  def format_ai_response(diagnosis)
    "**Diagnóstico:** #{diagnosis[:diagnosis]}\n\n" \
    "**Urgência:** #{diagnosis[:urgency]}/5\n\n" \
    "**O que fazer:** #{diagnosis[:solution]}"
  end
end

