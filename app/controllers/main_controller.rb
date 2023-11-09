class MainController < ApplicationController
    def index
      @developers = Developer.all
      @managers = Manager.all
    end
  end  