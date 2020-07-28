({
    onFormSubmit: function (component, event, helper) {
        var formData = event.getParam("formData");
        component.find("boatSearchResultsComponent").search(formData.boatTypeId);
    }
})