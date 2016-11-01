require 'rails_helper'

describe MessagesController do

  let!(:message) { create(:message) }

  let(:params) {{
    id: message.id,
    message: attributes_for(:message)
    }}

    let(:invalid_params) {{
      id: message.id,
      message: attributes_for(:message, text: nil)
      }}

  context 'with user login' do
    login_user
    describe 'GET #index' do

      before do
        get :index
      end

      it 'assigns the requested message to @message' do
        expect(assigns(:message)).to be_a_new(Message)
      end

      it 'assigns the requested messages to @messages' do
        expect(assigns(:messages)).to include message
      end

    end

    describe 'POST #create' do

      context 'with valid attributes' do

        before do
          post :create, params
        end

        it 'saves the new message in the database' do
          expect {
            post :create, params
          }.to change(Message, :count).by(1)
        end

        it 'redirect to the :index template' do
          expect(response).to redirect_to root_path
        end

      end

      context 'with invalid attributes' do

        before do
          post :create, invalid_params
        end

        it 'does not save the new message in the database' do
          expect {
            post :create, invalid_params
          }.not_to change(Message, :count)
        end

        it 'shows flash messages to warn the user' do
          expect(flash[:alert]).not_to be_empty
        end
      end
    end
  end
end
