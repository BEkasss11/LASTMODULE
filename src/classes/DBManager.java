    package classes;

    import java.sql.*;
    import java.util.ArrayList;
    import java.util.LinkedList;
    import java.util.List;

    public class DBManager {
        private  static Connection connection;

        static {
            try {
                Class.forName("org.postgresql.Driver");
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }
            try {
                connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/post_portal","postgres","ADMIN");
            } catch (SQLException e) {
                e.printStackTrace();
            }

        }

        public static List<News> getNews(){
            List<News> news = new ArrayList<>();
            try {
                PreparedStatement stmt = connection.prepareStatement("select n.id,n.post_date,n.title , n.content, c.id,c.name from news as n\n" +
                        " inner join news_cat as c on n.category_id = c.id;");
                ResultSet resultSet = stmt.executeQuery();
                while (resultSet.next()){
                    News news1 = new News();
                    news1.setId(resultSet.getLong("id"));
                    news1.setPost_date(resultSet.getTimestamp("post_date"));
                    news1.setTitle(resultSet.getString("title"));
                    news1.setContent(resultSet.getString("content"));

                    Category category = new Category();
                    category.setId(resultSet.getLong("id"));
                    category.setName(resultSet.getString("name"));
                    news1.setCategory(category);
                    news.add(news1);

                }
            } catch (SQLException e) {
                e.printStackTrace();
            }

            return  news;
        }

        public static  boolean addUser(User user){
          int rows = 0;
            try {
                PreparedStatement stmt = connection.prepareStatement("insert into users(email, password, full_name, role_id) values (?,?,?,'2')");
                stmt.setString(1, user.getEmail());
                stmt.setString(2, user.getPassword());
                stmt.setString(3, user.getFull_name());
                rows = stmt.executeUpdate();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            return  rows>0;
        }

        public  static  User getUser(String email){
            User users = null;
            try {
                PreparedStatement stmt = connection.prepareStatement("SELECT  * FROM  users WHERE email = ?");
                stmt.setString(1,email);
                ResultSet resultSet = stmt.executeQuery();
                if(resultSet.next()){
                    users= new User();
                    users.setEmail(resultSet.getString("email"));
                    users.setPassword(resultSet.getString("password"));
                    users.setFull_name(resultSet.getString("full_name"));
                    users.setId(resultSet.getLong("id"));
                    users.setRole(resultSet.getString("role_id"));
                }

            } catch (SQLException e) {
                throw  new RuntimeException(e);
            }
            return  users;
        }

        public static  boolean updateUser(User user){
            int row =0;
            User user1 = new User();
            try {
                PreparedStatement stmt = connection.prepareStatement("update users set  email = ?,password=?,full_name=?,role_id=?\n" +
                        "where  id=?;");
             stmt.setString(1,user.getEmail());
             stmt.setString(2,user.getPassword());
             stmt.setString(3,user.getFull_name());
             stmt.setString(4,user.getRole());
             stmt.setLong(5,user.getId());
             row = stmt.executeUpdate();
             stmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            return  row>0;
        }

        public  static  boolean addNews(News news){
              int rows =0;
            try {
                PreparedStatement stmt = connection.prepareStatement("insert into  news (post_date, category_id, title, content) values (Now(),?,?,?)");
                stmt.setLong(1,news.getCategory().getId());
                stmt.setString(2, news.getContent());
                stmt.setString(3,news.getTitle());
                rows = stmt.executeUpdate();
                stmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }

            return rows>0;

        }

        public  static List<Category> getCats(){

            List<Category> categories = new ArrayList<>();
            try {
                PreparedStatement stmt = connection.prepareStatement("SELECT  * from news_cat");
                ResultSet resultSet = stmt.executeQuery();
                while (resultSet.next()){
                    Category category = new Category();
                    category.setId(resultSet.getLong("id"));
                    category.setName(resultSet.getString("name"));
                    categories.add(category);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
            return  categories;
        }

        public static  News getNews(Long id){
            News news1 = null;
            try {
                PreparedStatement stmt = connection.prepareStatement("select n.id,n.post_date,n.title , n.content, c.id,c.name from news as n\n" +
                        " inner join news_cat as c on n.category_id = c.id where n.id=?;");
                stmt.setLong(1,id);
                ResultSet resultSet = stmt.executeQuery();
                if(resultSet.next()){
                    news1 = new News();
                    news1.setId(resultSet.getLong("id"));
                    news1.setContent(resultSet.getString("content"));
                    news1.setTitle(resultSet.getString("title"));
                    news1.setPost_date(resultSet.getTimestamp("post_date"));

                    Category category = new Category();
                    category.setId(resultSet.getLong("id"));
                    category.setName(resultSet.getString("name"));

                    news1.setCategory(category);

                }
                stmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            return  news1;
        }

        public static boolean updateNews(News news) {
            int rows = 0;
            try {
                PreparedStatement stmt = connection.prepareStatement("UPDATE news SET post_date=Now(), category_id=?, title=?, content=? WHERE id=?");

                stmt.setLong(1, news.getCategory().getId());
                stmt.setString(2, news.getTitle());
                stmt.setString(3, news.getContent());
                stmt.setLong(4, news.getId());
                rows = stmt.executeUpdate();
                stmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            return rows > 0;
        }


        public static boolean deleteNews(Long newsId) {
            int rows = 0;
            try {
                PreparedStatement stmt = connection.prepareStatement("DELETE FROM news WHERE id = ?");
                stmt.setLong(1, newsId);
                rows = stmt.executeUpdate();
                stmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            return rows > 0;
        }

        public  static  boolean addComment(Comment comment){
            int rows =0;
            try {
                PreparedStatement stmt = connection.prepareStatement("insert  into  comments(comment, post_date, user_id, news_id) VALUES (?,Now(),?,?);");
                stmt.setString(1,comment.getComment());
                stmt.setLong(2, comment.getUser().getId());
                stmt.setLong(3,comment.getNews().getId());
                rows = stmt.executeUpdate();
                stmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }

            return rows>0;
        }

        public static List<Comment> getCommentsOfNews(Long id){
            List<Comment> comments = new ArrayList<>();
            try {
                PreparedStatement statement = connection.prepareStatement("SELECT c.id, c.comment, c.post_date, u.id, u.email\n" +
                        "FROM comments AS c\n" +
                        "    INNER JOIN users u on u.id = c.user_id\n" +
                        "                      WHERE c.news_id = ? ");
                statement.setLong(1, id);
                ResultSet resultSet = statement.executeQuery();
                while (resultSet.next()){
                    Comment comment = new Comment();
                    comment.setId(resultSet.getLong("id"));
                    comment.setComment(resultSet.getString("comment"));
                    comment.setPost_date(resultSet.getTimestamp("post_date"));
                    User user = new User();
                    user.setId(resultSet.getLong("id"));
                    user.setEmail(resultSet.getString("email"));
                    comment.setUser(user);
                    comments.add(comment);
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
            return comments;
        }
    }

