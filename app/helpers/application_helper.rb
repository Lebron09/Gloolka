module ApplicationHelper
    def developer_count
        Developer.count
      end
    
      def manager_count
        Manager.count
      end
    
      def developers_without_manager_count
        Developer.where(manager_id: nil).count
      end
end
