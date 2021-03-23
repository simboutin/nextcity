import { ConversationalForm } from 'conversational-form';

const conversationalForm = (form, context, loader, submitForm) => ConversationalForm.startTheConversation({
  formEl: form,
  context: document.getElementById("cf-context"),
  userImage: form.dataset.userPhoto,
  robotImage: "https://kitt.lewagon.com/placeholder/users/turtleju",
  submitCallback: function() {
    // conversationalForm.addRobotChatResponse("");
    context.style.display = "none";
    loader.style.display = "block";
    setTimeout(submitForm, 5000);
  }
});

const initConversationalForm = () => {
  const form = document.getElementById("form");
  const context = document.getElementById("cf-context")
  const loader = document.getElementById("loader")
  function submitForm() {
    form.submit();
  }
  if (form) {
    conversationalForm(form, context, loader, submitForm);
    window.addEventListener('load', (e) => {
      conversationalForm(form, context, loader, submitForm);
    });
  }
}

export { initConversationalForm };
