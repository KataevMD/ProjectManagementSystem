// Please see documentation at https://learn.microsoft.com/aspnet/core/client-side/bundling-and-minification
// for details on configuring this project to bundle and minify static web assets.

// Write your JavaScript code.
$(document).ready(function () {

    function jQueryGetWizardStepOne() {
        $.ajax({
            type: 'GET',
            url: '/Projects/WizardStepOne',
            success: function (res) {
                $('#Wizard').html(res);
            },
        })
    }

});