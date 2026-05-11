# 📝 Output Formats (Disk Writes)

Depending on the active step in `PRD.md` and the configuration in configuration.md, the agent must write its output to the disk using the following strict XML formats.

### Step 1: Individual File Summaries
*Write to `summary_[filename].xml`*

```xml
<document_summary source="[Insert File Name]">
  <metadata>
    <date_processed>[Current Date]</date_processed>
    <document_type>[e.g., evidence, motion, decision]</document_type>
    <tags>[comma separated tags]</tags>
  </metadata>
  <facts>
    [Bullet points of objective, verifiable facts. Use <fact> tags with quotes from the source if configured.]
  </facts>
  <opinions_and_claims>
    [Bullet points of subjective allegations or demands with quotes from the source if configured.]
  </opinions_and_claims>
  <legal_views>
    [Bullet points of the legal arguments or statutes with quotes from the source if configured.]
  </legal_views>
</document_summary>
