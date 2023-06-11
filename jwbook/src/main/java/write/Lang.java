package write;

public enum Lang {
    BASH("bash"),
    C("C"),
    C_SHARP("csharp"),
    CPP("cpp"),
    CSS("css"),
    DIFF("diff"),
    GO("go"),
    GRAPHQL("graphql"),
    HTML("html"),
    JSON("json"),
    JAVA("java"),
    JAVASCRIPT("javascript"),
    KOTLIN("kotlin"),
    LUA("lua"),
    MAKEFILE("makefile"),
    MARKDOWN("markdown"),
    OBJECTIVE_C("objectivec"),
    PHP("php"),
    PERL("perl"),
    PYTHON("python"),
    R("R"),
    RUBY("ruby"),
    RUST("rust"),
    SCSS("scss"),
    SQL("sql"),
    PowerShell("powershell"),
    SWIFT("swift"),
    TYPESCRIPT("typescript"),
    VISUAL_BASIC_NET("vbnet"),
    YAML("yaml");

    private final String language;

    Lang(String language) {
        this.language = language;
    }

    public String getLanguage() {
        return language;
    }
}
