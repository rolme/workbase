export default class MetaFieldHandler {
  constructor() {
    this.handleFieldPerType();
  }

  handleFieldPerType() {
    $(document).on("change", ".meta-select-type", function(e) {
      var meta_event = new MetaFieldHandler();
      e.preventDefault();
      var fieldType = $(this).children("option").filter(":selected").text();
      if(fieldType == 'checkbox' || fieldType == 'datetime' || fieldType == 'date'){
        meta_event.hidePlaceholder();
        meta_event.hideSelectOption();
        meta_event.hideNumberRange();
      }else if(fieldType == 'textfield' || fieldType == 'textarea'){
        meta_event.showPlaceholder();
        meta_event.hideSelectOption();
        meta_event.hideNumberRange();
      }else if(fieldType == 'number'){
        meta_event.hidePlaceholder();
        meta_event.hideSelectOption();
        meta_event.showNumberRange();
      }else if(fieldType == 'dropdown'){
        meta_event.hidePlaceholder();
        meta_event.showSelectOption();
        meta_event.hideNumberRange();      
      }
    });
  }

  hidePlaceholder() {
    if(!$('.form-group.meta-placeholder').hasClass('hidden')){
      $('.form-group.meta-placeholder').addClass('hidden');
      $('.form-group.meta-placeholder input').val('');
    }    
  }

  hideSelectOption() {
    if(!$('.form-group.meta-options').hasClass('hidden')){
      $('.form-group.meta-options').addClass('hidden');
      $('.form-group.meta-options input').val('');
    }    
  }

  hideNumberRange() {
    if(!$('.form-group.number-range').hasClass('hidden')){
      $('.form-group.number-range').addClass('hidden');
      $('.form-group.number-range input').val('');
    }    
  }

  showPlaceholder() {
    $('.form-group.meta-placeholder').removeClass('hidden');    
  }

  showSelectOption() {
    $('.form-group.meta-options').removeClass('hidden');
  }

  showNumberRange() {
    $('.form-group.number-range').removeClass('hidden');
  }
}
