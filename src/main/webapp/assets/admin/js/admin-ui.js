(function ($) {
    'use strict';

    $(function () {
        $('[data-toggle="tooltip"]').tooltip();

        var checkboxes = $('table tbody input[type="checkbox"]');
        $('#selectAll').on('change', function () {
            checkboxes.prop('checked', this.checked);
        });
        checkboxes.on('change', function () {
            if (!this.checked) {
                $('#selectAll').prop('checked', false);
            }
        });

        $(document).on('change', '.avatar-upload .imageUpload', function () {
            if (!this.files || !this.files[0]) {
                return;
            }
            var preview = $(this).closest('.avatar-upload').find('.imagePreview');
            var reader = new FileReader();
            reader.onload = function (event) {
                preview.css('background-image', 'url("' + event.target.result + '")');
                preview.hide().fadeIn(650);
            };
            reader.readAsDataURL(this.files[0]);
        });
    });
}(jQuery));
