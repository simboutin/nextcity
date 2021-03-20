import { ConversationalForm } from 'conversational-form';

const initConversationalForm = () => {
  const form = document.getElementById("form");
  if (form) {
    var conversationalForm = ConversationalForm.startTheConversation({
      formEl: form,
      context: document.getElementById("cf-context"),
      userImage: "https://kitt.lewagon.com/placeholder/users/toninono",
      robotImage: "https://kitt.lewagon.com/placeholder/users/thoux",
      // submitCallback: function() {
      //   conversationalForm.addRobotChatResponse("Parfait. Cliquez-ici pour voir le résultat."); 
      // }
    });
  }
}

export { initConversationalForm };
