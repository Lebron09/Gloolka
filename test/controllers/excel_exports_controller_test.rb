require "test_helper"

class ExcelExportsControllerTest < ActionDispatch::IntegrationTest
  test "should get export_to_excel" do
    get excel_exports_export_to_excel_url
    assert_response :success
  end
end
