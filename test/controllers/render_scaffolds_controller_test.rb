require 'test_helper'

class RenderScaffoldsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @render_scaffold = render_scaffolds(:one)
  end

  test "should get index" do
    get render_scaffolds_url
    assert_response :success
  end

  test "should get new" do
    get new_render_scaffold_url
    assert_response :success
  end

  test "should create render_scaffold" do
    assert_difference('RenderScaffold.count') do
      post render_scaffolds_url, params: { render_scaffold: { contenido: @render_scaffold.contenido, titulo: @render_scaffold.titulo, user_id: @render_scaffold.user_id } }
    end

    assert_redirected_to render_scaffold_url(RenderScaffold.last)
  end

  test "should show render_scaffold" do
    get render_scaffold_url(@render_scaffold)
    assert_response :success
  end

  test "should get edit" do
    get edit_render_scaffold_url(@render_scaffold)
    assert_response :success
  end

  test "should update render_scaffold" do
    patch render_scaffold_url(@render_scaffold), params: { render_scaffold: { contenido: @render_scaffold.contenido, titulo: @render_scaffold.titulo, user_id: @render_scaffold.user_id } }
    assert_redirected_to render_scaffold_url(@render_scaffold)
  end

  test "should destroy render_scaffold" do
    assert_difference('RenderScaffold.count', -1) do
      delete render_scaffold_url(@render_scaffold)
    end

    assert_redirected_to render_scaffolds_url
  end
end
