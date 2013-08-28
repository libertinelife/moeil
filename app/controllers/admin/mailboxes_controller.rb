class Admin::MailboxesController < AdminController

  load_and_authorize_resource

  inherit_resources

  actions :all, except: :show

  def create
    create! do |success, error|
      success.html { redirect_to admin_domain_mailboxes_path(resource.domain) }
    end
  end

  def destroy
    destroy! do |success, error|
      success.html { redirect_to admin_domain_mailboxes_path(resource.domain) }
    end
  end

  def new
    @domains = Domain.managable current_mailbox
    build_resource.domain_id = params[:domain_id]
  end

  def update
    update! do |success, error|
      success.html { redirect_to admin_domain_mailboxes_path(resource.domain) }
    end
  end

protected

  def collection
    @mailboxes ||= end_of_association_chain.where(domain_id: params[:domain_id])
  end

end
