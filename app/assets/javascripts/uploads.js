$(document).ready(function(){
  // disable auto discover
  Dropzone.autoDiscover = false;

  // grap our upload form by its id
  var myDropzone =  new Dropzone(".dropzone-upload", {
    url: '/uploads',
    // restrict image size to a maximum 1MB
    maxFilesize: 1,
    maxFiles: 1,
    // changed the passed param to one accepted by
    // our rails app
    paramName: "upload[image]",
    // show remove links on each image upload
    addRemoveLinks: true,
    params:{
      'authenticity_token':  $(document).find('input[name=authenticity_token]').val()
    },
    init: function() {
      myDropzone = this;

      id = $(document).find('.dropzone > input[type=file]').data('id');
      // upload existing file to dropzone
      if(parseInt(id)>0){
        $.get('/uploads/'+id, function(data) {
          var mockFile = { name: data.fileName, size: 1000000,  fileID: data.fileID };
          myDropzone.options.addedfile.call(myDropzone, mockFile);
          myDropzone.options.thumbnail.call(myDropzone, mockFile, data.fileUrl);
          // $(document).find('.dropzone').addClass('dz-max-files-reached');
          // $(document).find('.dropzone').addClass('dz-started');
          // add id for remove section
          $(document).find('.dz-remove').attr('id', id)
        });
      }
      //Restore initial message when queue has been completed
      this.on("drop", function(event) {
        image_preview = $(document).find('.dz-preview');
        if((this.files.length > 0) || (image_preview.length>0)){
          event.preventDefault();
          // $(document).find(file.previewElement).remove();
        }
      });
      //Restore initial message when queue has been completed
      this.on("click", function(event) {
        image_preview = $(document).find('.dz-preview')
        if((this.files.length > 0) || (image_preview.length>0)){
          event.preventDefault;
        }
      });
      this.on("maxfilesexceeded", function(file) {
        // unit_upload_attributes_image
        $(document).find(file.previewElement).remove();
      });
    },
    // addedfile: function(file){
    //   debugger
    // },
    // if the upload was successful
    success: function(file, response){
      $(document).find('.upload-id').val(response.fileID);
      // find the remove button link of the uploaded file and give it an id
      // based of the fileID response from the server
      $(file.previewTemplate).find('.dz-remove').attr('id', response.fileID);
      // add the dz-success class (the green tick sign)
      $(file.previewElement).addClass("dz-success");
    },
    autoProcessQueue: true,
    //when the remove button is clicked
    removedfile: function(file){
      // grap the id of the uploaded file we set earlier
      var id = $(file.previewTemplate).find('.dz-remove').attr('id'); 
      alert('This action will remove image pamanent.')
      // make a DELETE ajax request to delete the file
      $.ajax({
        type: 'DELETE',
        url: '/uploads/' + id,
        success: function(data){
          $(document).find(file.previewElement).remove();
          $(document).find('.upload-id').val('');
          fileFieldid = $(document).find('input[type=file]').first().attr('id');
          $('#'+fileFieldid.replace('image', 'id')).remove();
          console.log(data.message);
        }
      });
    }
  });
});