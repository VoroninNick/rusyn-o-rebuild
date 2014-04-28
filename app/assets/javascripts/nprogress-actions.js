/**
 * Created by vikewoods on 9/3/13.
 */
$(document).ready(function(){

});

/**
* Add NProgress
*/

$(document).on('page:fetch',   function() { NProgress.start(); });
$(document).on('page:change',  function() { NProgress.done(); });
$(document).on('page:restore', function() { NProgress.remove(); });