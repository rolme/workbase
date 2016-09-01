$(document).ready(function(){
  // disable auto discover
  Dropzone.autoDiscover = false;

  // grap our upload form by its id
var myDropzone =  new Dropzone(".dropzone-upload", {
    url: $(".dropzone-upload").parents('.dropzone-form').attr('action'),
    // restrict image size to a maximum 1MB
    maxFilesize: 1,
    maxFiles: 1,
    // changed the passed param to one accepted by
    // our rails app
    paramName: "unit[upload_attributes][image]",
    // show remove links on each image upload
    addRemoveLinks: true,
    init: function() {
      
        myDropzone = this;

        //Restore initial message when queue has been completed
        this.on("drop, change", function(event) {
            console.log(myDropzone.files);            
        });
      this.on("maxfilesexceeded", function(file) {
        // unit_upload_attributes_image
        this.removeAllFiles();
        this.addFile(file);
      });
    },
    // if the upload was successful
    success: function(file, response){
      console.log("dfjksdfjksdhkfjh")
      // find the remove button link of the uploaded file and give it an id
      // based of the fileID response from the server
      $(file.previewTemplate).find('.dz-remove').attr('id', response.fileID);
      // add the dz-success class (the green tick sign)
      $(file.previewElement).addClass("dz-success");
    },
    autoProcessQueue: false,
    //when the remove button is clicked
    removedfile: function(file){
      // grap the id of the uploaded file we set earlier
      var id = $(file.previewTemplate).find('.dz-remove').attr('id'); 

      // make a DELETE ajax request to delete the file
      $.ajax({
        type: 'DELETE',
        url: '/uploads/' + id,
        success: function(data){
          console.log(data.message);
        }
      });
    }
  });
  $('.dropzone-form .submit').click(function(){
    myDropzone.processQueue();
  });
  $('.dropzone, .dz.clickable').on('click', function(e){
    e.preventDefault();
  })
});