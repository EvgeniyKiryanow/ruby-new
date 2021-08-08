// Load all the channels within this directory and all subdirectories.
// Channel files must be named *_channel.js.

const channels = require.context('.', true, /_channel\.js$/)
channels.keys().forEach(channels)

document.addEventListener("DOMContentLoaded", function(event)  {
    $('.deleteAction').click(function (){
        const current_item = $(this).parents('tr')[0]
        if(confirm("Are you okay?")) {
            $.ajax({
                url:'/items/' + $(current_item).attr('data-item_id'),
                type: 'POST',
                data: { _method: "DELETE" },
                success: function (){
                    $(current_item).fadeOut("slow")
                }
            })
        }
    })
})