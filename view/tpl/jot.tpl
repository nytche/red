<div id="profile-jot-wrapper" >

	<form id="profile-jot-form" action="{{$action}}" method="post" >
		<input type="hidden" name="type" value="{{$ptyp}}" />
		<input type="hidden" name="profile_uid" value="{{$profile_uid}}" />
		<input type="hidden" name="return" value="{{$return_path}}" />
		<input type="hidden" name="location" id="jot-location" value="{{$defloc}}" />
		<input type="hidden" name="expire" id="jot-expire" value="{{$defexpire}}" />
		<input type="hidden" name="media_str" id="jot-media" value="" />
		<input type="hidden" name="source" id="jot-source" value="{{$source}}" />
		<input type="hidden" name="coord" id="jot-coord" value="" />
		<input type="hidden" name="post_id" value="{{$post_id}}" />
		<input type="hidden" name="webpage" value="{{$webpage}}" />
		<input type="hidden" name="preview" id="jot-preview" value="0" />
		{{$mimeselect}}
		{{$layoutselect}}

		<div id="jot-title-wrap"><input name="title" id="jot-title" type="text" placeholder="{{$placeholdertitle}}" value="{{$title}}" class="jothidden" style="display:none"></div>
		{{if $catsenabled}}
		<div id="jot-category-wrap"><input name="category" id="jot-category" type="text" placeholder="{{$placeholdercategory}}" value="{{$category}}" class="jothidden" style="display:none" /></div>
		{{/if}}
		{{if $webpage}}
		<div id="jot-pagetitle-wrap"><input name="pagetitle" id="jot-pagetitle" type="text" placeholder="{{$placeholdpagetitle}}" value="{{$pagetitle}}" class="jothidden" style="display:none" /></div>
		{{/if}}
		<div id="jot-text-wrap">
		<textarea rows="5" cols="64" class="profile-jot-text" id="profile-jot-text" name="body" placeholder="{{$share}}">{{$content}}</textarea>
		</div>
		<div id="profile-jot-text-loading"></div>

<div id="profile-jot-submit-wrapper" class="jothidden">
	<input type="submit" id="profile-jot-submit" name="submit" value="{{$share}}" />

	<div id="profile-upload-wrapper" style="display: {{$visitor}};" >
		<div id="wall-image-upload-div" ><i id="wall-image-upload" class="icon-camera jot-icons" title="{{$upload}}"></i></div>
	</div> 
	<div id="profile-attach-wrapper" style="display: {{$visitor}};" >
		<div id="wall-file-upload-div" ><i id="wall-file-upload" class="icon-paper-clip jot-icons" title="{{$attach}}"></i></div>
	</div> 

	<div id="profile-link-wrapper" style="display: {{$visitor}};" ondragenter="linkdropper(event);" ondragover="linkdropper(event);" ondrop="linkdrop(event);" >
		<i id="profile-link" class="icon-link jot-icons" title="{{$weblink}}" ondragenter="return linkdropper(event);" ondragover="return linkdropper(event);" ondrop="linkdrop(event);" onclick="jotGetLink(); return false;"></i>
	</div> 
	<div id="profile-video-wrapper" style="display: {{$visitor}};" >
		<i id="profile-video" class="icon-facetime-video jot-icons" title="{{$video}}" onclick="jotVideoURL();return false;"></i>
	</div> 
	<div id="profile-audio-wrapper" style="display: {{$visitor}};" >
		<i id="profile-audio" class="icon-volume-up jot-icons" title="{{$audio}}" onclick="jotAudioURL();return false;"></i>
	</div> 
	<div id="profile-location-wrapper" style="display: {{$visitor}};" >
		<i id="profile-location" class="icon-globe jot-icons" title="{{$setloc}}" onclick="jotGetLocation();return false;"></i>
	</div> 
	<div id="profile-nolocation-wrapper" style="display: none;" >
		<i id="profile-nolocation" class="icon-circle-blank jot-icons" title="{{$noloc}}" onclick="jotClearLocation();return false;"></i>
	</div>
	<div id="profile-expire-wrapper" style="display: {{$feature_expire}};" >
		<i id="profile-expires" class="icon-eraser jot-icons" title="{{$expires}}" onclick="jotGetExpiry();return false;"></i>
	</div> 
	<div id="profile-encrypt-wrapper" style="display: {{$feature_encrypt}};" >
		<i id="profile-encrypt" class="icon-key jot-icons" title="{{$encrypt}}" onclick="red_encrypt('{{$cipher}}','#profile-jot-text',$('#profile-jot-text').val());return false;"></i>
	</div> 


	<div id="profile-rotator-wrapper" style="display: {{$visitor}};" >
		<div id="profile-rotator"></div>
	</div>  

	{{if $showacl}}
	<div id="profile-jot-perms" class="profile-jot-perms" style="display: {{$pvisit}};" >
		<a href="#profile-jot-acl-wrapper" id="jot-perms-icon" class="icon {{$lockstate}}"  title="{{$permset}}" ></a>{{$bang}}
	</div>
	{{/if}}

	{{if $preview}}<span onclick="preview_post();" id="jot-preview-link"><i class="icon-eye-open jot-icons" title="{{$preview}}"></i></span>{{/if}}


	<div id="profile-jot-perms-end"></div>


	<div id="profile-jot-plugin-wrapper">
	{{$jotplugins}}
	</div>

	<div id="jot-preview-content" style="display:none;"></div>

	<div style="display: none;">
		<div id="profile-jot-acl-wrapper" style="width:auto;height:auto;overflow:auto;">
			{{$acl}}
			<hr style="clear:both"/>
			{{$jotnets}}
		</div>
	</div>
<!-- Modal for item expiry-->
<div class="modal fade" id="expiryModal" tabindex="-1" role="dialog" aria-labelledby="expiryModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title" id="expiryModalLabel">{{$expires}}</h4>
      </div>
     <!--  <div class="modal-body"> -->
            <div class="modal-body form-group" style="width:90%">
                <div class="input-group input-group-sm date" id="datetimepicker1">
                    <span class="input-group-addon"><!-- <span class="glyphicon glyphicon-calendar"></span> -->
                    <span class="icon-calendar"></span>
                    </span>
                    <input id="expiration-date" type='text' class="form-control" data-format="YYYY-MM-DD HH:mm" size="20"/>
                </div>
            </div>
      <!-- </div> -->
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">{{$expiryModalCANCEL}}</button>
        <button id="expiry-modal-OKButton" type="button" class="btn btn-primary">{{$expiryModalOK}}</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<script type="text/javascript">
  $(function() {
    $('#datetimepicker1').datetimepicker({
      language: 'us',
      icons: {
					time: "icon-time",
					date: "icon-calendar",
					up: "icon-arrow-up",
					down: "icon-arrow-down"
				}
    });
  });
</script>
</div>





<div id="profile-jot-end"></div>
</form>
</div>
		{{if $content}}<script>initEditor();</script>{{/if}}
